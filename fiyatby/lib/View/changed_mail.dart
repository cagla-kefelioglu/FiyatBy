// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/View/profile.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class MailDegis extends StatefulWidget {
  const MailDegis({Key? key});

  @override
  State<MailDegis> createState() => _MailDegisState();
}

class _MailDegisState extends State<MailDegis> {
  TextEditingController Newpassword = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 1,
              height: height * 1,
              decoration: BoxDecoration(
                color: Colors.white,
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
                            "Profil ",
                            style: _textStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: width * 1,
                          height: 50,
                          child: Container(
                            decoration: _boxDecoration,
                            child: TextFormField(
                              controller: password,
                              decoration: _fiedlDecoration.copyWith(
                                labelText: "Eski mailiniz",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: width * 1,
                          height: 50,
                          child: Container(
                            decoration: _boxDecoration,
                            child: TextFormField(
                              controller: Newpassword,
                              decoration: _fiedlDecoration.copyWith(
                                labelText: "Yeni mailiniz",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: width * 1,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              String currentEmail = password.text;
                                  
                              String newEmail = Newpassword.text;

                              if (currentEmail == newEmail) {
                                print(
                                    "Yeni e-posta adresi mevcut e-posta adresiyle aynı.");
                              } else {
                                FirebaseAuth.instance.currentUser!
                                    .updateEmail(newEmail)
                                    .then((_) {
                                  print(
                                      "E-posta adresi başarıyla güncellendi.");
                                  Grock.to(Profile());
                                }).catchError((error) {
                                  print(
                                      "E-posta adresi güncellenirken bir hata oluştu: $error");
                                });
                              }
                            },
                            child: Text("Maili Değiştir"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

InputDecoration _fiedlDecoration = InputDecoration(
    labelText: "Yeni mailiniz",
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
