// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names

import 'package:fiyatby/Constant/constant.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [Container(
          decoration: BoxDecoration(color: Constant.white,),
          
        )],
      ),
    );
  }
}