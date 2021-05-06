import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:nueva_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageAPI();

  UploadTask uploadFile(String path, File image) =>
      _firebaseStorageAPI.upoaldFile(path, image);
}
