// ignore_for_file: unused_import, unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, duplicate_import, unused_local_variable, unused_element, unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiyatby/View/HomePage.dart';
import 'package:fiyatby/popup/delete_popup.dart';
import 'package:fiyatby/popup/save_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

import '../../Constant/constant.dart';

import '../../assets.dart';

class TahminDialogPopat extends StatelessWidget {
  var type,
      origin,
      driveTrain,
      motor,
      silindir,
      beygir,
      sehir,
      otoyol,
      model,
      marka,
      fiyat,
      kategori,
      cd,
      multi;
  File? image;
  String imageURL;
  TahminDialogPopat(
      {this.type,
      this.origin,
      this.driveTrain,
      this.motor,
      this.silindir,
      this.beygir,
      this.sehir,
      this.otoyol,
      this.model,
      this.marka,
      this.cd,
      this.multi,
      required this.fiyat,
      required this.image,
      required this.imageURL,
      required this.kategori});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: _buildChild(context, height, width),
      ),
    );
  }

  _buildChild(BuildContext context, var height, var width) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: width * 0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: SvgPicture.asset(
                                      Assets.icons.closeSVG,
                                      width: width * 0.2,
                                      height: height * 0.01,
                                      color: Constant.blueOne,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.7,
                              child: Image.file(
                                image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Fiyat : ",
                                style: _text.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontFamily: 'Poppins',
                                    fontSize: 24),
                              ),
                              Text(
                                "120£",
                                style: _text.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Constant.dark,
                                    fontFamily: 'Poppins',
                                    fontSize: 24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0, right: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 8),
                                        height: 51,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Constant.greenOne,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                            onPressed: () async {
                                              if (kategori == 'car') {
                                                Map<dynamic, dynamic> map = {
                                                  "category": "Araba",
                                                  "fiyat": fiyat,
                                                  "beygir": beygir,
                                                  "driveTrain": driveTrain,
                                                  "marka": marka,
                                                  "model": model,
                                                  "type": type,
                                                  "origin": origin,
                                                  "motor": motor,
                                                  "otoyol": otoyol,
                                                  "sehir": sehir,
                                                  "silindir": silindir,
                                                  "image": imageURL,
                                                };

                                                FirebaseFirestore.instance
                                                    .collection("Users")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString())
                                                    .update({
                                                  "car": FieldValue.arrayUnion(
                                                      [map])
                                                });
                                              } else if (kategori == 'phone') {
                                                Map<dynamic, dynamic> map = {
                                                  "category": "Telefon",
                                                  "fiyat": fiyat,
                                                  "ekran": beygir,
                                                  "marka": marka,
                                                  "model": model,
                                                  "ram": motor,
                                                  "hafiza": sehir,
                                                  "onKamera": silindir,
                                                  "image": imageURL,
                                                };

                                                FirebaseFirestore.instance
                                                    .collection("Users")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString())
                                                    .update({
                                                  "phone":
                                                      FieldValue.arrayUnion(
                                                          [map])
                                                });
                                              } else if (kategori ==
                                                  'computer') {
                                                Map<dynamic, dynamic> map = {
                                                  "category": "Bilgisayar",
                                                  "fiyat": fiyat,
                                                  "ekran": beygir,
                                                  "ram": motor,
                                                  "hiz": sehir,
                                                  "hd": silindir,
                                                  "cd":cd==0? "Yok" :"Var",
                                                  "multi":multi==0?"Yok":"Var",
                                                  "trend":otoyol,
                                                  "image": imageURL,
                                                };

                                                FirebaseFirestore.instance
                                                    .collection("Users")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString())
                                                    .update({
                                                  "computer":
                                                      FieldValue.arrayUnion(
                                                          [map])
                                                });
                                              }

                                              _openDialog(context, image);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.detailSVG,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "Ürünü Kaydet",
                                                  style: _buttonText,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, left: 10.0, right: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 8),
                                        height: 51,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                            onPressed: () {
                                              Grock.to(Homepage());
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.deleteSVG,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Ana Sayfa",
                                                  style: _buttonText,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      );

  BoxDecoration _clikDecoration = BoxDecoration(
      color: Constant.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Constant.blueOne, width: 1.5));
  TextStyle _text = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Constant.dark);
  TextStyle _buttonText = TextStyle(
      fontSize: 21,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5);
}

Future _openDialog(context, image) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => SaveDialogPopat(image: image)));
