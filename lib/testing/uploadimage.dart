import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UplaodImage extends StatefulWidget {
  const UplaodImage({super.key});

  @override
  State<UplaodImage> createState() => _UplaodImageState();
}

class _UplaodImageState extends State<UplaodImage> {
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref('Post');

  Future getImageGallary() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("no any image there");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                getImageGallary();
                print("Image selected");
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 500,
                width: 300,
                child: _image != null
                    ? Image.file(
                        _image!.absolute,
                        fit: BoxFit.cover, // Use BoxFit to handle image scaling
                      )
                    : const Icon(Icons.image,
                        size: 100), // Adjust size if needed
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              firebase_storage.Reference ref = firebase_storage
                  .FirebaseStorage.instance
                  .ref('/Abhisingh' 'abhi');

              firebase_storage.UploadTask uploadTask =
                  ref.putFile(_image!.absolute);

              await Future.value(uploadTask);
              var newUrl = ref.getDownloadURL();

              print("Upload tapped");
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: const Center(
                  child: Text(
                "Upload",
                style: TextStyle(fontSize: 25),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
