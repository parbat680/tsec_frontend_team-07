import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tsec_app/controllers/profile_controller.dart';

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? _image;

  ProfileController _profileController = ProfileController.instance;

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
      _profileController.uploadImage = _image;
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  _galleryPick() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _profileController.uploadImage = _image;

      setState(() {
        _image = File(picked.path);
      });
    }
  }

  // List of gender in our dropdown menu
  var genderChoice = [
    'male',
    'female',
    'rather not say',
  ];

  // List of gender in our dropdown menu
  var ageList = ['18 - 24', '25 - 30', '30 -40 ', '40 and above'];

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
              width: width / 2,
              height: height * 0.2,
              child: _image == null
                  ? CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_default.png'),
                      backgroundColor: Colors.white,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!),
                      backgroundColor: Colors.white,
                    ),
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
        SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          controller: _profileController.name,
          decoration: InputDecoration(
            label: Text("Name"),
            hintText: "eg. John doe",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {},
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Choose Your gender",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, color: Colors.grey)),
          child: DropdownButton(
            hint: Text('gender'),
            value: _profileController.gender.value,
            isExpanded: true,
            underline: Divider(
              height: 0,
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomRight,
            icon: const Icon(Icons.keyboard_arrow_down),
            menuMaxHeight: 200,
            items: genderChoice.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _profileController.gender.value = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Choose Your Age",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.0, color: Colors.grey)),
          child: DropdownButton(
            hint: Text('Age'),
            value: _profileController.age.value,
            isExpanded: true,
            underline: Divider(
              height: 0,
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomRight,
            icon: const Icon(Icons.keyboard_arrow_down),
            menuMaxHeight: 200,
            items: ageList.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _profileController.age.value = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
