import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Donate_2 extends StatefulWidget {
  const Donate_2({super.key});

  @override
  State<Donate_2> createState() => _Donate_2State();
}

class _Donate_2State extends State<Donate_2> {
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                //code to upload image
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                print('${file?.path}');

                if (file == null) return;
                //Import dart:core
                String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                /*Step 2: Upload to Firebase storage*/
                //Install firebase_storage
                //Import the library

                //Get a reference to storage root
                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');

                //Create a reference for the image to be stored
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName);

                //Handle errors/success
                try {
                  //Store the file
                  await referenceImageToUpload.putFile(File(file!.path));
                  //Success: get the download URL
                  imageUrl = await referenceImageToUpload.getDownloadURL();
                  print(imageUrl);
                } catch (error) {
                  //Some error occurred
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Upload Image'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.file_upload),
              onPressed: () {
                // Implement your function to upload image
              },
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Gadget Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description of Gadget',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Donor Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Donor Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Donor Address',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: const Text('View Donate'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
