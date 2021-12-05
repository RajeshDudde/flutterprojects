import 'dart:io';
import 'dart:typed_data';
//import 'dart:ui';
//import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/models/stores.dart';

class DatabaseService {
  // final String? uid;
  // DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance
      .collection('casy'); // firestore changed to firebasefirestore
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
  // Future<void> updateUserData(String sugars, String name, int strength) async {
  //   return await brewCollection.doc(uid).set({
  //     //setData changed to set
  //     'sugars': sugars,
  //     'name': name,
  //     'strength': strength,
  //   });
  // }

  // Future<void> saveImages(File? _images, String? complaint) async {
  //   (_images) async {
  //     String imageURL = await uploadFile(_images);
  //     brewCollection.doc().update({
  //       "images": FieldValue.arrayUnion([imageURL]),
  //       "complaint": complaint,
  //     });
  //   };
  // }

  // Future<String> uploadFile(File _image) async {
  //   Reference storageReference = FirebaseStorage.instance.ref().child('casy/');
  //   UploadTask uploadTask = storageReference.putFile(_image);
  //   dynamic url;
  //   await uploadTask.whenComplete(() {
  //     url = storageReference.getDownloadURL();
  //   }).catchError((onError) {
  //     // ignore: avoid_print
  //     print(onError);
  //   });
  //   // ignore: avoid_print
  //   print('File Uploaded');

  //   return url;
  // }

  // brew list from snapshot
  List<Stores> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Stores(
          images: doc['imageUrl'] ?? '', complaint: doc['complaint'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Stores>> get person {
    //print(brewCollection.snapshots().map(_brewListFromSnapshot));
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
