//import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firstapp/models/user.dart';
//import 'package:firstapp/services/auth.dart';
import 'package:firstapp/services/database.dart';
import 'package:firstapp/shared/constants.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:flutter/services.dart' show rootBundle;
//import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  //late File _image;

  _ComplaintState();
  //   create();
  // }
  // ignore: unused_element
  //_ComplaintState.ensureInitialized();

  String? complaint;
  UploadTask? task;
  File? file;

  //var img = Image.asset('images/flutter.jpg');
  // File _image = await getImageFileFromAssets('images/preview.jpg');           /*File('images/preview.jpg');*/

  // Widget build(BuildContext context) {
  // ignore: unused_local_variable
  Future getImage(bool gallery) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
    // ImagePicker picker = ImagePicker();
    // XFile pickedFile;
    // // Let user select photo from gallery
    // if (gallery) {
    //   pickedFile = (await picker.pickImage(
    //     source: ImageSource.gallery,
    //   ))!;
    // }
    // // Otherwise open camera to get new photo
    // else {
    //   pickedFile = (await picker.pickImage(
    //     source: ImageSource.camera,
    //   ))!;
    // }

    // setState(() {
    //   // ignore: unnecessary_null_comparison
    //   if (pickedFile != null) {
    //     // _images.add(File(pickedFile.path));
    //     _image = File(pickedFile.path); // Use if you only need a single picture

    //   } else {
    //     // ignore: avoid_print
    //     print('No image selected.');
    //   }
    // });
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = DatabaseService.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    //upload to casy here
    FirebaseFirestore.instance
        .collection('casy')
        .doc()
        .set({"imageUrl": urlDownload, "complaint": complaint});
    //print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  //File _image = File("images/flutter.jpg");
  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');

  //   final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  //   return file;
  // }

  // _ComplaintState._create();

  // void create() async {
  //   // Call the private constructor
  //   // _ComplaintState? component;
  //   _image = await getImageFileFromAssets('images/flutter.jpg');
  //   // print(_image);
  //   // return component
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initUser().OnComplete(() {
  //     setState(() {});
  //   });
  // }

  // void _initUser() async {
  //   _image = await getImageFileFromAssets('images/flutter.jpg');
  //   print(_image);
  // }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complaint Registration Page"),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    const Text(
                      'Complaint',
                      style: TextStyle(fontSize: 26),
                    ),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: ' write complaint here'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter complaint' : null,
                        onChanged: (val) {
                          setState(() => complaint = val);
                        }),
                    const SizedBox(height: 8),
                    Text(
                      fileName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    //Container(child: Image.file(_image)),
                    // Image.file(_image),
                    RawMaterialButton(
                      fillColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(Icons.add_photo_alternate_rounded,
                          color: Colors.white,
                          semanticLabel: 'press icon to select'),
                      elevation: 8,
                      onPressed: () {
                        getImage(true);
                      },
                      padding: const EdgeInsets.all(15),
                      shape: const CircleBorder(),
                    ),
                    TextButton(
                        onPressed: () async {
                          await uploadFile();
                        },
                        child: const Text('save')),
                    const SizedBox(height: 20),
                    task != null ? buildUploadStatus(task!) : Container(),
                  ]),
            )));
  }
}
