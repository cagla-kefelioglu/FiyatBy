// ignore_for_file: unused_import, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/components/card.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../Assets.dart';

class SaveProducts extends StatefulWidget {
  const SaveProducts({super.key});

  @override
  State<SaveProducts> createState() => _SaveProductsState();
}

class _SaveProductsState extends State<SaveProducts> {
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Kayıtlı Ürünler ",
                              style: _textStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List a = snapshot.data!['car'];
                                      return Wrap(
                                        alignment: WrapAlignment.start,
                                        direction: Axis.horizontal,
                                        runSpacing: 20,
                                        spacing: width * 0.05,
                                        children: List<Widget>.generate(
                                            a.length, (index) {
                                          return CardComponents(data: a[index]);
                                        }),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                                SizedBox(height: 20,),
                                   StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List a = snapshot.data!['phone'];
                                      return Wrap(
                                        alignment: WrapAlignment.start,
                                        direction: Axis.horizontal,
                                        runSpacing: 20,
                                        spacing: width * 0.05,
                                        children: List<Widget>.generate(
                                            a.length, (index) {
                                          return CardComponents(data: a[index]);
                                        }),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                                 SizedBox(height: 20,),
                                   StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List a = snapshot.data!['computer'];
                                      return Wrap(
                                        alignment: WrapAlignment.start,
                                        direction: Axis.horizontal,
                                        runSpacing: 20,
                                        spacing: width * 0.05,
                                        children: List<Widget>.generate(
                                            a.length, (index) {
                                          return CardComponents(data: a[index]);
                                        }),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    ));
  }
}

TextStyle _textStyle = TextStyle(
    fontSize: 40,
    color: Constant.blueOne,
    fontFamily: 'RobotoSlab',
    decoration: TextDecoration.none,
    letterSpacing: 2);

InputDecoration _fiedlDecoration = InputDecoration(
    labelText: "Kullanıcı Şifresi",
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 195, 23, 10),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Constant.dark,
      ),
    ),
    filled: true, //backgroundu değişmek için true yapılır
    fillColor: Constant.input, //background

    labelStyle: TextStyle(
      color: Constant.dark,
      letterSpacing: 0.6,
      fontSize: 15,
      fontFamily: 'PoppinsBold',
    ));

BoxDecoration _boxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.white.withOpacity(1),
      spreadRadius: 0,
      blurRadius: 30,
      offset: Offset(-10, -10), // changes position of shadow
    ),
    BoxShadow(
      color: Constant.input,
      spreadRadius: 0,
      blurRadius: 30,
      offset: Offset(10, 10), // changes position of shadow
    ),
  ],
);
