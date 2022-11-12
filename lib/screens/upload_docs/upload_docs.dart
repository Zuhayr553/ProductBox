import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox/constants/showtoast.dart';
import 'package:productbox/constants/theme_data.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:productbox/screens/dashboard.dart';

class UploadDocuments extends StatefulWidget {
  UploadDocuments({Key? key}) : super(key: key);

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  bool complete = false;
  int uploaded = 0;
  List a = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData().kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.06,
                ),
                const Center(
                  child: Text(
                    'Upload Documents',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 15,
                        width: 40,
                        decoration: BoxDecoration(
                            color: a.length > 0
                                ? MyThemeData().kButtonBack
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 15,
                        width: 40,
                        decoration: BoxDecoration(
                            color: a.length > 1
                                ? MyThemeData().kButtonBack
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 15,
                        width: 40,
                        decoration: BoxDecoration(
                            color: a.length > 2
                                ? MyThemeData().kButtonBack
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 15,
                        width: 40,
                        decoration: BoxDecoration(
                            color: a.length > 3
                                ? MyThemeData().kButtonBack
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ),
                // DotsIndicator(
                //   onTap: (position) {
                //     if (_currentPosition == 3) {
                //       setState(() {
                //         _currentPosition = 0;
                //       });
                //     } else {
                //       setState(() {
                //         _currentPosition++;
                //       });
                //     }
                //   },
                //   dotsCount: 4,
                //   position: _currentPosition.toDouble(),
                //   decorator: DotsDecorator(
                //     size: const Size(40.0, 12.0),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0)),
                //     activeSize: const Size(40.0, 12.0),
                //     activeShape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0)),
                //     activeColor: MyThemeData().kButtonBack,
                //     // activeShape: RoundedRectangleBorder(
                //     //     borderRadius: BorderRadius.circular(0.0)),
                //   ),
                // ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: kTextBorder, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage('P');
                        },
                        child: Text(
                          'Profile Picture',
                          style: TextStyle(
                              color: MyThemeData().kText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      profilepicture == null
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(5),
                              child: Image.file(profilepicture!)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: kTextBorder, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage('D');
                        },
                        child: Text(
                          'Driving License',
                          style: TextStyle(
                              color: MyThemeData().kText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      drivingLicense == null
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(5),
                              child: Image.file(drivingLicense!)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: kTextBorder, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _pickFile('C');
                        },
                        child: Text(
                          'Certificate',
                          style: TextStyle(
                              color: MyThemeData().kText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      certificate == null
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(5),
                              child: Image.file(certificate!)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: kTextBorder, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage('PP');
                        },
                        child: Text(
                          'Passport',
                          style: TextStyle(
                              color: MyThemeData().kText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      passport == null
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(5),
                              child: Image.file(passport!)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                InkWell(
                  onTap: () {
                    a.length >= 4
                        ? Get.to(const Dashboard())
                        : showToasterror('Please Uploaded All Images');
                  },
                  child: Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                        color: a.length >= 4
                            ? MyThemeData().kButtonBack
                            : const Color.fromARGB(252, 146, 146, 146),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child:
                          // loader == true
                          //     ? const CircularProgressIndicator(
                          //         color: Colors.white,
                          //       )
                          //     :
                          Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: MyThemeData().kWhite),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  File? profilepicture;
  File? drivingLicense;
  File? certificate;
  File? passport;
  pickImage(String whichImage) {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 138, 138, 138),
          content: const Text("Choose image source"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context, ImageSource.camera);
              },
              child: Container(
                  height: 40,
                  width: 100,
                  color: Color.fromARGB(255, 46, 46, 46),
                  child: Center(
                      child: Text(
                    "Camera",
                    style: TextStyle(color: MyThemeData().kWhite),
                  ))),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              child: Container(
                  height: 40,
                  width: 100,
                  color: Color.fromARGB(255, 46, 46, 46),
                  child: Center(
                      child: Text(
                    "Gallery",
                    style: TextStyle(color: MyThemeData().kWhite),
                  ))),
            ),
          ]),
    ).then((ImageSource? source) async {
      if (source != null) {
        final pickedFile = await ImagePicker().pickImage(source: source);

        if (pickedFile != null) {
          if (!a.contains(whichImage)) {
            a.add(whichImage);
          }
        }
        setState(() => whichImage == 'P'
            ? profilepicture = File(pickedFile!.path)
            : whichImage == 'D'
                ? drivingLicense = File(pickedFile!.path)
                : whichImage == 'C'
                    ? certificate = File(pickedFile!.path)
                    : whichImage == 'PP'
                        ? passport = File(pickedFile!.path)
                        : null);
      }
    });
  }

  _pickFile(String ab) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      certificate = File(result.files.single.path!);
      if (!a.contains(ab)) {
        a.add(ab);
      }
      setState(() {});
    }
  }
}
