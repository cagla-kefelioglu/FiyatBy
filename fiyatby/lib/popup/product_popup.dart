// ignore_for_file: unused_import, unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, duplicate_import, unused_local_variable, unused_element, unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiyatby/View/urun_detay.dart';
import 'package:fiyatby/View/urun_detay_car.dart';
import 'package:fiyatby/popup/delete_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock_exports.dart';

import '../../Constant/constant.dart';

import '../../assets.dart';

class ProductsPopat extends StatelessWidget {
  ProductsPopat({required this.data});
  var data;
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
        child: _buildChild(context, height, width, data),
      ),
    );
  }

  _buildChild(BuildContext context, var height, var width, var data) =>
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
                                      color: Constant.blueOne,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              Assets.images.img5,
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
                                data['fiyat'].toString(),
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
                                            onPressed: () {
                                              //if(widget.category == "Bilgisayar")
                                              Grock.to(DetailCarProducts(
                                                  data: data));
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
                                                  "Ürün Detayı",
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
                                              FirebaseFirestore.instance
                                                  .collection("Users")
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .update({
                                                "car": FieldValue.arrayRemove(
                                                    [data])
                                              });
                                              _openDialogTwo(context);
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
                                                  "Ürünü Sil",
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

// Future _openDialog(context) => showDialog(
//     barrierDismissible: false,
//     barrierColor: Constant.blueOne,
//     context: context,
//     builder: ((context) => RedDialogPopat()));
Future _openDialogTwo(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => DeletePopat()));
