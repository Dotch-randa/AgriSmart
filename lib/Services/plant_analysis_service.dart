import 'dart:convert';
import 'package:http/http.dart' as http;

class PlantAnalysisService {
  // استعمل Gemini مجاناً أو Claude API
  static const String _apiKey = 'YOUR_GEMINI_API_KEY';
  static const String _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

  Future<PlantAnalysisResult> analyzePlant(String imageUrl) async {
    final response = await http.post(
      Uri.parse('$_endpoint?key=$_apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {
                'text': '''أنت خبير زراعي. حلل هذه الصورة للنبات وأعطني:
1. اسم المرض أو المشكلة (إن وُجدت)
2. أعراض واضحة
3. العلاج الموصى به
4. نسبة الثقة في التشخيص

أجب بصيغة JSON فقط:
{
  "disease": "اسم المشكلة",
  "symptoms": ["عرض1", "عرض2"],
  "treatment": "طريقة العلاج",
  "confidence": 85,
  "isHealthy": false
}'''
              },
              {
                'inlineData': {
                  'mimeType': 'image/jpeg',
                  'data': await _getBase64FromUrl(imageUrl),
                }
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates'][0]['content']['parts'][0]['text'] as String;
      final jsonStr = text.replaceAll('```json', '').replaceAll('```', '').trim();
      final result = jsonDecode(jsonStr);
      return PlantAnalysisResult.fromJson(result);
    } else {
      throw Exception('فشل التحليل: ${response.statusCode}');
    }
  }

  Future<String> _getBase64FromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    return base64Encode(response.bodyBytes);
  }
}

class PlantAnalysisResult {
  final String disease;
  final List<String> symptoms;
  final String treatment;
  final int confidence;
  final bool isHealthy;

  PlantAnalysisResult({
    required this.disease,
    required this.symptoms,
    required this.treatment,
    required this.confidence,
    required this.isHealthy,
  });

  factory PlantAnalysisResult.fromJson(Map<String, dynamic> json) {
    return PlantAnalysisResult(
      disease: json['disease'] ?? 'غير محدد',
      symptoms: List<String>.from(json['symptoms'] ?? []),
      treatment: json['treatment'] ?? '',
      confidence: json['confidence'] ?? 0,
      isHealthy: json['isHealthy'] ?? false,
    );
  }
}