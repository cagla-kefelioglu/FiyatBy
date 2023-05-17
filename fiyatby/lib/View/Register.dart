// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, unnecessary_new

import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/View/Login.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../Assets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Constant.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.85,
                  height: height * 0.1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [
                              Constant.greenOne,
                              Constant.greenTwo,
                              Constant.blueTwo,
                              Constant.blueOne,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GrockContainer(
                          onTap: () {
                            Grock.to(Login());
                          },
                          width: width * 0.84,
                          height: height * 0.098,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Constant.white),
                          child: Column(children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                        color: Constant.dark,
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: width * 1,
              height: height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.85,
                    height: height * 0.6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Constant.greenOne,
                                Constant.greenTwo,
                                Constant.blueTwo,
                                Constant.blueOne,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.84,
                            height: height * 0.595,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Constant.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Kayıt Ol",
                                      style: TextStyle(
                                          color: Constant.dark,
                                          fontFamily: 'RobotoSlab',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Expanded(
                                  child: Form(
                                      child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: width * 1,
                                              height: 50,
                                              child: Container(
                                                decoration: _boxDecoration,
                                                child: TextFormField(
                                                  decoration:
                                                      _fiedlDecoration.copyWith(
                                                    labelText: "Mail",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 50,
                                              child: Container(
                                                decoration: _boxDecoration,
                                                child: TextFormField(
                                                    decoration:
                                                        _fiedlDecoration),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 50,
                                              child: Container(
                                                decoration: _boxDecoration,
                                                child: TextFormField(
                                                  decoration:
                                                      _fiedlDecoration.copyWith(
                                                    labelText: "Şifre Tekrarı",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: width * 1,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Kayıt Ol",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Constant.blueOne,
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(10),
                                                    )),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      Assets.images.img4,
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Google ile kayıt ol",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Constant.dark),
                                                    ),
                                                  ],
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color:
                                                            Constant.blueOne),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(10),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

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
}
