import 'dart:async';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';

enum FileSource {
  path,
  bytes,
}

class CloudinaryService {
  final Cloudinary _cloudinary = Cloudinary.unsignedConfig(
    cloudName: 'YOUR_CLOUD_NAME',
    // apiKey: 'YOUR_API_KEY',
    // apiSecret: 'YOUR_API_SECRET',
  );

  Future<CloudinaryResponse> uploadImage({
    required String path,
    required FileSource fileSource,
    bool signed = true,
    ProgressCallback? progressCallback,
  }) async {
    try {
      List<int>? fileBytes;

      if (fileSource == FileSource.bytes) {
        fileBytes = await _getFileBytes(path);
      }

      final response = signed
          ? await _cloudinary.upload(
        file: path,
        fileBytes: fileBytes,
        resourceType: CloudinaryResourceType.image,
        folder: 'your_folder_name',
        progressCallback: progressCallback,
      )
          : await _cloudinary.unsignedUpload(
        file: path,
        fileBytes: fileBytes,
        resourceType: CloudinaryResourceType.image,
        folder: 'your_folder_name',
        progressCallback: progressCallback,
        uploadPreset: 'YOUR_UPLOAD_PRESET',
      );

      return response;
    } catch (e) {
      // Handle errors appropriately
      print('Cloudinary Error: $e');
      throw e;
    }
  }

  Future<List<int>> _getFileBytes(String path) async {
    return await File(path).readAsBytes();
  }
}
