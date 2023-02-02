import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? _image;

  PopupSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  tileColor: Theme.of(context).cardColor,
                  leading: Icon(
                    Icons.image,
                  ),
                  title: Text(
                    "Choose from gallery",
                    style: TextStyle(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _galleryPick();
                  },
                ),
                ListTile(
                  tileColor: Theme.of(context).cardColor,
                  leading: Icon(
                    Icons.camera_enhance_rounded,
                  ),
                  title: Text("Choose from camera", style: TextStyle()),
                  onTap: () {
                    Navigator.pop(context);
                    _cameraPick();
                  },
                ),
              ],
            ),
          );
        });
  }

  _cameraPick() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  _galleryPick() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: width / 2,
              height: height * 0.2,
              child: _image == null
                  ? CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_default.png'),
                    )
                  : CircleAvatar(backgroundImage: FileImage(_image!)),
            ),
            Positioned(
              bottom: 0.0,
              right: 10.0,
              child: InkWell(
                onTap: () => PopupSelector(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Enter your name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
