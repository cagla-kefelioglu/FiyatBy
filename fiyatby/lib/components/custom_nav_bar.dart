// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, sort_child_properties_last

import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/View/Login.dart';
import 'package:fiyatby/View/Register.dart';
import 'package:fiyatby/View/fiyatTahmin.dart';
import 'package:fiyatby/View/profile.dart';
import 'package:fiyatby/View/save_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Assets.dart';
import '../View/HomePage.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 1;
  final List<Widget> pages = [SaveProducts(), Homepage(), Profile()];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // type: BottomNavigationBarType.shifting,
            onTap: onTap,
            backgroundColor: Constant.greenOne,
            selectedItemColor: Constant.white,
            unselectedItemColor: Constant.white,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.icons.menuOneSvg,
                    color: Constant.white,
                    width: 30,
                  ),
                  label: "Save"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.icons.menuTwoSvg,
                      color: Constant.white, width: 30),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Assets.images.img1),
                        radius: 13,
                      ),
                      backgroundColor: Constant.blueOne,
                      radius: 16,
                    ),
                    backgroundColor: Constant.blueTwo,
                    radius: 17,
                  ),
                  label: "Profile")
            ]),
      ),
    );
  }
}
