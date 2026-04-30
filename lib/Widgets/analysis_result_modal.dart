import 'package:flutter/material.dart';
import 'package:app_3ouchba/services/plant_analysis_service.dart';

class AnalysisResultModal extends StatelessWidget {
  final PlantAnalysisResult result;
  final String imageUrl;

  const AnalysisResultModal({
    super.key,
    required this.result,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.all(24),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // صورة + نتيجة رئيسية
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(imageUrl,
                      width: 90, height: 90, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: result.isHealthy
                              ? const Color(0xFFE8F5E9)
                              : const Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          result.isHealthy ? '✅ النبات بصحة جيدة' : '⚠️ يوجد مشكلة',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: result.isHealthy
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFE65100),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        result.disease,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      _ConfidenceBadge(confidence: result.confidence),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // الأعراض
            if (result.symptoms.isNotEmpty) ...[
              const Text('الأعراض الملاحظة',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: result.symptoms
                    .map((s) => _SymptomChip(label: s))
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],

            // العلاج
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F8E9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFA5D6A7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.healing, color: Color(0xFF2E7D32), size: 20),
                      SizedBox(width: 8),
                      Text('العلاج الموصى به',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(result.treatment,
                      style: const TextStyle(
                          fontSize: 14, height: 1.6, color: Colors.black87)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // زر إغلاق
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('حسناً، شكراً!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  final int confidence;
  const _ConfidenceBadge({required this.confidence});

  @override
  Widget build(BuildContext context) {
    final color = confidence >= 80
        ? const Color(0xFF2E7D32)
        : confidence >= 60
            ? const Color(0xFFF57F17)
            : Colors.red;
    return Row(
      children: [
        Icon(Icons.analytics_outlined, size: 14, color: color),
        const SizedBox(width: 4),
        Text('ثقة: $confidence%',
            style: TextStyle(
                fontSize: 13, color: color, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _SymptomChip extends StatelessWidget {
  final String label;
  const _SymptomChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF90CAF9)),
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 13, color: Color(0xFF1565C0))),
    );
  }
}