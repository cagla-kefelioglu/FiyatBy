// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/custom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: CustomNavBar(),
    );
  }
}