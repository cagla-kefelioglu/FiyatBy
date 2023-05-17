// ignore_for_file: unused_import, prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../Assets.dart';
import '../Constant/constant.dart';
import 'Info.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

 void initState() {
   Future.delayed(const Duration(seconds:2),(){
     Grock.toRemove(Info());
   });
    super.initState();
   }

  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
     return Scaffold(
      backgroundColor: Constant.white,
      body:Center(child: Image.asset(Assets.images.img1,fit:BoxFit.fill,width:width*0.8,),)
    );
    
  }
}
