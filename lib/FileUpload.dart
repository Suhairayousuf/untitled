
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class FileUpload extends StatefulWidget {
  const FileUpload({Key? key}) : super(key: key);

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {

  late File imgFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File upload'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: TextButton.styleFrom(primary: Colors.black87),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles();
                if (result != null) {
                  Uint8List? fileBytes = result.files.first.bytes;
                  String fileName = result.files.first.name;
                  PlatformFile file = result.files.first;
                  print(file.name);
                  print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                  // Upload file
                  //await FirebaseFirestore.instance.ref('uploads/$fileName').putData(fileBytes!);
                  FirebaseFirestore.instance.collection('uploads').add({
                  }
                  );
                }
              },child: Text('File'),

            ),
            imgFile==''?Container():
            Container(height: 150,width: 150,),
            Text('upload'),
          ],

        ),
      ),

    );
  }
}
