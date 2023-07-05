// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiyatby/Assets.dart';
import 'package:fiyatby/popup/product_popup.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../Constant/constant.dart';

class CardComponents extends StatefulWidget {
  CardComponents({required this.data});
  var data;
  
  @override
  State<CardComponents> createState() => _CardComponentsState();
}

class _CardComponentsState extends State<CardComponents> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GrockContainer(
      onTap: () {
        _openDialog(context, widget.data);
      },
      width: width * 0.4,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Constant.blueOne, width: 1),
        borderRadius: BorderRadius.circular(15),
        color: Constant.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       Image.network(widget.data['image'],width: width*0.3,height: 70,fit: BoxFit.cover,),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Fiyat:",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.data['fiyat'],
                style: TextStyle(
                    color: Constant.dark, fontSize: 20, fontFamily: 'Poppins'),
              )
            ],
          )
        ],
      ),
    );
  }
}

Future _openDialog(context, data) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => ProductsPopat(
          data: data,
        )));
