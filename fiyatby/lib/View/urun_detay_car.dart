// ignore_for_file: unused_import, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables, camel_case_types

import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/components/card.dart';
import 'package:fiyatby/popup/fiyat_tahmin_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import '../Assets.dart';

class DetailCarProducts extends StatefulWidget {
  DetailCarProducts({super.key, required this.data});
  var data;
  @override
  State<DetailCarProducts> createState() => _DetailCarProductsState();
}

class _DetailCarProductsState extends State<DetailCarProducts> {
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
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: SvgPicture.asset(Assets.icons.arroweSVG)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Ürün Detay",
                              style: _textStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: Constant.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    child: Image.asset(
                                      Assets.images.img5,
                                      /*ürünün resmi gelecek */
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  infoElements(
                                    text: 'Fiyat: ',
                                    data: widget.data['fiyat'].toString(),
                                  ),
                                  infoElements(
                                      text: 'Motor Büyüklüğü: ',
                                      data: widget.data['motor'].toString()),
                                  infoElements(
                                      text: 'Silindirler: ',
                                      data: widget.data['silindir'].toString()),
                                  infoElements(
                                      text: 'Beygir gücü: ',
                                      data: widget.data['beygir'].toString()),
                                  infoElements(
                                      text: 'Şehir içi mol/galon: ',
                                      data: widget.data['sehir'].toString()),
                                  infoElements(
                                      text: 'Otoyol mol/galon: ',
                                      data: widget.data['otoyol'].toString()),
                                  infoElements(
                                      text: 'Mekanizasyon: ',
                                      data:
                                          widget.data['driveTrain'].toString()),
                                  infoElements(
                                      text: 'Üretim Yeri: ',
                                      data: widget.data['origin'].toString()),
                                  infoElements(
                                      text: 'Marka: ',
                                      data: widget.data['marka'].toString()),
                                  infoElements(
                                      text: 'Model: ',
                                      data: widget.data['model'].toString()),
                                  infoElements(
                                      text: 'Tip: ',
                                      data: widget.data['type'].toString()),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
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

class infoElements extends StatelessWidget {
  String text;
  var data;
  infoElements({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Constant.grey, style: BorderStyle.solid))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: Constant.dark,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 15,
              color: Constant.dark,
              fontFamily: 'Poppins',
            ),
          )
        ]),
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
