// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, sort_child_properties_last, unnecessary_new, prefer_const_literals_to_create_immutables, unused_field, annotate_overrides, unused_label, unrelated_type_equality_checks, non_constant_identifier_names, avoid_print

import 'package:fiyatby/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import 'Login.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constant.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => Component(
                  description: demo_data[index].description,
                  images: demo_data[index].images,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => slider(
                            isActive: index == _pageIndex,
                          )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(140),
                                gradient: LinearGradient(
                                    colors: [
                                      Constant.greenOne,
                                      Constant.blueTwo
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(150),
                                    )),
                                onPressed: () {
                                  /*Grock.toRemove(Login());*/
                                  _pageIndex == 1
                                      ? Grock.toRemove(Login())
                                      : _pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease);
                                  print(_pageIndex);
                                },
                                child: Text(
                                  "Devam Et",
                                  style: TextStyle(
                                      color: Constant.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class slider extends StatelessWidget {
  const slider({
    super.key,
    this.isActive = false,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 10,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
          color: isActive ? Constant.greenOne : Constant.greenTwo,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoard {
  final String images, description;
  OnBoard({required this.images, required this.description});
}

final List<OnBoard> demo_data = [
  OnBoard(
      description: 'Ürününü değerinde sat !',
      images: 'assets/images/slider1.png'),
  OnBoard(
      description: 'Paran cebinde kalsın !',
      images: 'assets/images/slider2.png'),
];

class Component extends StatelessWidget {
  const Component({
    super.key,
    required this.images,
    required this.description,
  });
  final String images, description;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              images,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              description,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ]),
        ),
      ],
    );
  }
}
