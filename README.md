# 🌿 AgriSmart — AI-Powered Plant Disease Diagnosis for Algerian Farmers

> Built for the NABTA Hackathon by **CipherMind**

---

##  What It Does

AgriSmart is a full-stack agricultural AI platform that helps Algerian farmers diagnose plant diseases from a photo and get treatment advice in their language — Darija, French, or Classical Arabic.

A farmer takes a photo of a sick leaf → the AI identifies the disease → the chatbot explains the treatment → all in under 5 seconds.

---

##  Architecture

```
Flutter App (Mobile)          Web Interface
       ↓ image upload                ↓
  FastAPI Inference Server (port 8000)
       ↓ EfficientNet-B0 + ResNet50 soft-voting ensemble
       ↓ JSON { class, confidence, top3 }
  Flutter / Web displays result
       ↓ auto-request treatment
  FastAPI Chatbot Server (port 8001)
       ↓ Groq LLaMA 3.3 70B
       ↓ responds in farmer's language (Darija / French / Arabic)
```

---

##  AI Models

### Ensemble: EfficientNet-B0 + ResNet50 (Soft Voting)

| Model | PlantDoc F1 | Gen Score | Params |
|-------|------------|-----------|--------|
| EfficientNet-B0 | 0.435 | 0.600 | 4.1M |
| ResNet50 | 0.469 | 0.632 | 25.6M |
| **Ensemble** | **~0.50+** | — | — |

- **40 unified disease classes** across 3 datasets
- **Generalization Score** = harmonic mean of val F1 and PlantDoc OOD F1
- **Confidence threshold** calibrated via Youden's J statistic on PlantDoc held-out test set
- Predictions below threshold → `"Unrecognized / Low Confidence"` — the model refuses to guess when uncertain

### Training Data

| Dataset | Role | Size |
|---------|------|------|
| PlantVillage | Training | ~20k images |
| Plant Disease Expert | Training | ~195k images |
| PlantDoc train split | Domain adaptation | ~2k images |
| PlantDoc test split | OOD validation only | ~236 images |

### Training Setup
- Hardware: Kaggle Tesla T4 GPU
- Framework: PyTorch 2.x + torchvision
- Loss: Focal Loss (γ=2.5) + log-dampened inverse frequency class weights
- Optimizer: AdamW — backbone lr=1e-5, head lr=4e-4
- Scheduler: CosineAnnealingWarmRestarts (Phase 2)
- Augmentation: RandomResizedCrop, ColorJitter, RandomPosterize, GaussianBlur, RandomErasing

---

## 📱 Flutter App Features

- 📸 **Plant Disease Diagnosis** — camera or gallery, real-time AI result
- 🤖 **AI Chatbot** — multilingual treatment advice (Darija / French / Arabic)
- 🌾 **Crop Fact Sheets** — 10 key Algerian crops with planting calendar, water needs, diseases, yield
- 🗺️ **Map** — location-based features
- 🌤️ **Live Weather** — Open-Meteo API, GPS-based, no API key required
- 📴 **Offline Mode** — crop sheets cached on device, visual indicator when offline

---

## 🗂️ Project Structure

```
AgriSmart/                          ← master branch (Python / AI)
├── main.py                         ← training entry point
├── chat/
│   └── chatbot_server.py           ← Groq LLaMA multilingual chatbot API
├── inference/
│   ├── inference_server.py         ← EfficientNet-B0 + ResNet50 ensemble API
│   ├── class_to_idx.json           ← 40-class label mapping
│   └── threshold.json              ← Youden's J calibrated threshold
├── models/
│   └── factory.py                  ← backbone builder (EfficientNet, ResNet, MobileNet)
├── training/
│   ├── train.py                    ← sequential training manager
│   └── ensemble_eval.py            ← soft-voting ensemble evaluation
├── utils/
│   ├── dataset.py                  ← unified dataset class
│   ├── augmentations.py            ← train/val transforms
│   └── metrics.py                  ← FocalLoss, ECE, compute_metrics
├── .gitignore
└── README.md

main branch                         ← Flutter app
```

---

## 🚀 Getting Started

### Prerequisites

```bash
pip install torch torchvision fastapi uvicorn python-multipart pillow groq python-dotenv
```

### 1. Set up environment variables

Create a `.env` file in the project root:

```
GROQ_API_KEY=your_groq_api_key_here
```

Get a free key at [console.groq.com](https://console.groq.com)

### 2. Start the inference server

```bash
cd inference
python -m uvicorn inference_server:app --host 0.0.0.0 --port 8000
```

Test:
```
GET  http://localhost:8000/health
POST http://localhost:8000/predict   (multipart: file=<image>)
```

### 3. Start the chatbot server

```bash
cd chat
python -m uvicorn chatbot_server:app --host 0.0.0.0 --port 8001
```

Test:
```
POST http://localhost:8001/chat
Body: { "message": "كيفاش نعالج هاد المرض؟", "disease_context": "Apple___Apple_scab" }
```

### 4. Run the Flutter app

```bash
git checkout main
flutter pub get
flutter run
```

Update the server IP in `diagnostic_screen.dart`:
```dart
const String _inferenceUrl = 'http://YOUR_IP:8000';
const String _chatbotUrl   = 'http://YOUR_IP:8001';
```

> Android emulator: use `10.0.2.2` instead of `localhost`

---

##  API Reference

### `POST /predict`

**Request:** multipart form — `file` (image)

**Response:**
```json
{
  "class": "Tomato___Late_blight",
  "confidence": 0.87,
  "unrecognized": false,
  "top3": [
    ["Tomato___Late_blight", 0.87],
    ["Tomato___Early_blight", 0.08],
    ["Tomato___healthy", 0.03]
  ],
  "model": "ensemble (efficientnet_b0 + resnet50)"
}
```

### `POST /chat`

**Request:**
```json
{
  "message": "Comment traiter cette maladie?",
  "disease_context": "Apple___Apple_scab"
}
```

**Response:**
```json
{
  "response": "Pour traiter la tavelure du pommier...",
  "model": "llama-3.3-70b-versatile"
}
```

---

## 📊 Supported Classes (40)

Covers: **Tomato, Apple, Potato, Grape, Corn, Pepper, Rice, Strawberry, Cherry, Peach, Orange, Blueberry, Raspberry, Soybean** — disease and healthy classes per crop.

---

## 🔮 Roadmap

- [ ] Fruit disease detection (EfficientNet retraining)
- [ ] ONNX + OpenVINO export for faster CPU inference (~50ms/image)
- [ ] Grad-CAM heatmaps for prediction explainability
- [ ] On-device inference (fully offline diagnosis)
- [ ] Push notifications for regional disease alerts

---

## ⚠️ Notes

- Model checkpoints (`.pt` files) are not committed — too large for GitHub. Download from the shared drive link.
- Never commit `.env` — it contains your Groq API key.

---

*Made with 🌱 by CipherMind —  Hackathon*
