import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localads/utilis/helpers.dart';

class GetImage extends StatelessWidget {
  GetImage({Key? key}) : super(key: key);
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Uploader l'image",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () async {
                      final result =
                          await picker.pickImage(source: ImageSource.camera);
                      Navigator.of(context).pop(File(result!.path));
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.image),
                    onPressed: () async {
                      final result =
                          await picker.pickImage(source: ImageSource.gallery);
                      Navigator.of(context).pop(File(result!.path));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
