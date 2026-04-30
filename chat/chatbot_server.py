import os
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from groq import Groq

app = FastAPI()
app.add_middleware(CORSMiddleware, allow_origins=["*"])

# ---------------------------------------------------------------------------
# IMPORTANT: never hardcode API keys in source code.
# Set this environment variable before running:
#   Windows:  set GROQ_API_KEY=your_key_here
#   Linux:    export GROQ_API_KEY=your_key_here
# ---------------------------------------------------------------------------
client = Groq(api_key=os.environ["GROQ_API_KEY"])

# ---------------------------------------------------------------------------
# System prompt — restricts scope to agriculture only
# ---------------------------------------------------------------------------
SYSTEM_PROMPT = """You are NABTA, an expert agricultural advisor helping farmers in Algeria and North Africa.

STRICT RULES — follow without exception:
1. ONLY answer questions related to agriculture, farming, crops, plant diseases, irrigation, fertilizers, pest control, harvesting, and soil management.
2. If the question is NOT about agriculture, respond ONLY with this exact message in the same language as the question:
   - Darija: "أنا متخصص غير في الفلاحة. اسألني على المحاصيل، الأمراض، أو الري."
   - French: "Je suis spécialisé uniquement en agriculture. Posez-moi des questions sur les cultures, maladies ou irrigation."
   - Arabic: "أنا متخصص في الزراعة فقط. اسألني عن المحاصيل والأمراض والري."
3. Detect the language of the farmer's question (Darija, French, or Classical Arabic) and ALWAYS respond in the SAME language.
4. Give practical, simple advice a farmer can act on immediately.
5. Keep answers concise — farmers need clear actionable steps, not long essays.
6. If the question includes a plant disease diagnosis, give specific treatment advice for that disease.

Language detection hints:
- Darija: واش, كيفاش, بغيت, دير, تاع, كلشي, مزيان
- French: comment, quand, pourquoi, planter, maladie, traitement
- Classical Arabic: كيف, متى, ماذا, الزراعة, المرض, التربة
"""

# ---------------------------------------------------------------------------
# Request model
# ---------------------------------------------------------------------------
class ChatRequest(BaseModel):
    message: str
    disease_context: str = None


# ---------------------------------------------------------------------------
# Routes
# ---------------------------------------------------------------------------

@app.post("/chat")
async def chat(request: ChatRequest):
    # Basic length guard — prevents prompt injection via very long messages
    if len(request.message) > 1000:
        raise HTTPException(status_code=400, detail="Message too long (max 1000 chars)")

    user_message = request.message.strip()
    if not user_message:
        raise HTTPException(status_code=400, detail="Empty message")

    # Prepend disease context when coming from the classifier
    if (request.disease_context
            and request.disease_context != "Unrecognized / Low Confidence"):
        user_message = (
            f"[Context: The farmer's plant was diagnosed with: {request.disease_context}]\n\n"
            f"{user_message}"
        )

    response = client.chat.completions.create(
        model="llama-3.3-70b-versatile",
        messages=[
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user",   "content": user_message},
        ],
        max_tokens=500,
        temperature=0.7,
    )

    return {
        "response": response.choices[0].message.content,
        "model":    response.model,
    }


@app.get("/health")
def health():
    return {"status": "ok", "service": "chatbot"}
