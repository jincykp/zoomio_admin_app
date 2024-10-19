import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  // Upload a single image to Firebase Storage
  Future<String?> uploadImage(String path, BuildContext context) async {
    print("Starting image upload...");
    File file = File(path);
    try {
      // Generate a unique file name using milliseconds since epoch
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = storage.ref().child('vehicle_images/$fileName');

      // Upload the file
      UploadTask uploadTask = ref.putFile(file);

      // Monitor the upload task's progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print(
            'Upload progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100}%');
      });

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL
      String downloadURL = await ref.getDownloadURL();
      print("Image uploaded successfully! Download URL: $downloadURL");
      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  // Upload multiple images to Firebase Storage
  Future<List<String?>> uploadMultipleImages(
      List<String> paths, BuildContext context) async {
    List<String?> downloadURLs = []; // List to store the download URLs
    for (String path in paths) {
      print("Uploading image at path: $path");
      String? downloadURL = await uploadImage(
          path, context); // Call the single image upload function
      downloadURLs.add(downloadURL); // Add the download URL to the list
    }
    return downloadURLs; // Return the list of download URLs
  }
}
