import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final Reference _storageReference = FirebaseStorage.instance.ref();

  UploadTask upoaldFile(String path, File image) {
    return _storageReference.child(path).putFile(image);
  }
}
