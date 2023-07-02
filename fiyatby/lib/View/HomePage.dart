// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, use_build_context_synchronously, unnecessary_null_comparison, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/View/fiyatTahmin.dart';
import 'package:fiyatby/assets.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CategorizationException implements Exception {
  final String message;

  CategorizationException(this.message);

  @override
  String toString() => 'CategorizationException: $message';
}

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

Future<String> categorizeImage(File image) async {
  final apiUrl = 'https://api.imagga.com/v2/tags';
  final apiKey = 'acc_7a44421d1980177';
  final apiSecret = '22f1892667d43dd6411c36fda90cf421';

  List<int> imageBytes = await image.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  Map<String, String> headers = {
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret')),
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  Map<String, String> body = {
    'image_base64': base64Image,
    'limit': '5',
  };
  String tagName='';
  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> tags = jsonResponse['result']['tags'] as List<dynamic>;
      List<String> car = ["car","auto","automobile","motor vehicle","transportation"];
      List<String> computer= ["notebook","laptop","portable computer","personal computer","computer"];
      List<String> phone= ["remote contro","device","button","telephone","call"];
      if (tags != null && tags.isNotEmpty) {
        print(tags);
        for (var tag in tags) {
          if (tag is Map<String, dynamic> &&
              tag.containsKey('tag') &&
              tag.containsKey('confidence')) {
            tagName = tag['tag']['en'];
            double confidence = tag['confidence'].toDouble();

            if (car.contains(tagName)) {
              print("// Araba tanınmıştır");
              tagName="car";
            } else if (phone.contains(tagName)) {
              print("// Telefon tanınmıştırr");
              tagName="phone";
            } else if (computer.contains(tagName)) {
              print("// Bilgisayar tanınmıştır ");
              tagName="computer";
            }
          }
        }
      } else {
        print('Invalid response format: Tags not found');
        throw CategorizationException('Tags not found');
      }
    } else {
      print('Image analysis failed with status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error analyzing image: $error');
    throw CategorizationException('Error analyzing image: $error');
  }
  return tagName;
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
    String category = await categorizeImage(image!);
    print(category);
    Grock.to(
        FiyatTahmin(image: image!, category: category, imageURL: imageURL));
  }

  void onImageButtonPressed(ImageSource source) async {
    try {
      final pickedFile = await picker.getImage(source: source);
      image = File(pickedFile!.path);

      String uniqFileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDirImages.child(uniqFileName);

      await referenceImageToUpload.putFile(image!);
      imageURL = await referenceImageToUpload.getDownloadURL();

      String category = await categorizeImage(image!);
      print(category);
      Grock.to(
          FiyatTahmin(image: image!, category: category, imageURL: imageURL));
    } catch (e, stackTrace) {
      print("Hata: $e");
      print("Stack Trace: $stackTrace");
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
