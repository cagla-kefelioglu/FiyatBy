// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, use_build_context_synchronously, unnecessary_null_comparison, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/View/fiyatTahmin.dart';
import 'package:fiyatby/assets.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? image;
  final picker = ImagePicker();
  String imageURL = '';
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    image = File(pickedFile!.path);

    String uniqFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqFileName);
    try {
      await referenceImageToUpload.putFile(image!);
      imageURL = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print('Hata: $e');
    }

    String category = 'Telefon';
    Grock.to(
        FiyatTahmin(image: image!, category: category, imageURL: imageURL));
  }

  void onImageButtonPressed(ImageSource source) async {
    try {
      await getImage(source);
    } catch (e) {
      print("SA Kral");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: width * 1,
                decoration: BoxDecoration(
                  color: Constant.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Hoş Geldin ",
                              style: _textStyle,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: width * 1,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Constant.blueOne,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GrockContainer(
                              onTap: () {},
                              child: Text(
                                "Kayıtlı Ürünlerim",
                                style: _textStyle.copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Constant.dark),
                              ),
                            )
                          ],
                        ),
                      ),
                      GrockContainer(
                        margin: EdgeInsets.only(top: 20),
                        width: width * 1,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Constant.greenOne, Constant.greenTwo],
                          ),
                        ),
                        onTap: () {
                          onImageButtonPressed(ImageSource.camera);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.icons.camera,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Kameraya Git",
                              style: _textStyle.copyWith(
                                  color: Constant.white, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                      GrockContainer(
                        margin: EdgeInsets.only(top: 20),
                        width: width * 1,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Constant.blueTwo, Constant.blueOne],
                          ),
                        ),
                        onTap: () {
                          onImageButtonPressed(ImageSource.gallery);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.icons.galeri,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Galeriye Git",
                              style: _textStyle.copyWith(
                                  color: Constant.white, fontSize: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle = TextStyle(
    fontSize: 40,
    color: Constant.blueOne,
    fontFamily: 'RobotoSlab',
    decoration: TextDecoration.none,
    letterSpacing: 2);
