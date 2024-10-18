import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  //upload the image to firebase storage
  Future<String?> uploadImage(String path, BuildContext context) async {
    print("image uploading");
    File file = File(path);
    try {
      String fileName = DateTime.now().toString();
      Reference ref = storage.ref().child('vehicle_images/$fileName');
//upload the file
      UploadTask uploadtask = ref.putFile(file);
//wait the upload complete
      await uploadtask;
      //get the download url
      String downloadURL = await ref.getDownloadURL();
      print("download url : $downloadURL");
      return downloadURL;
    } catch (e) {
      print("there is an error");
      print(e);
      return null;
    }
  }
}
