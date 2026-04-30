// AVANT :
// import 'package:firebase_storage/firebase_storage.dart';

// APRÈS :
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final _supabase = Supabase.instance.client;

  Future<String> uploadPlantImage(File imageFile, String userId) async {
    final String fileName = '${const Uuid().v4()}.jpg';
    final String filePath = 'plants/$userId/$fileName';

    // Upload vers Supabase Storage (bucket "plants")
    await _supabase.storage.from('plants').upload(
      filePath,
      imageFile,
      fileOptions: const FileOptions(contentType: 'image/jpeg'),
    );

    // Retourner l'URL publique (équivalent de getDownloadURL)
    return _supabase.storage.from('plants').getPublicUrl(filePath);
  }
}