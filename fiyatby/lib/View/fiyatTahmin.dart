// ignore_for_file: unused_import, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_null_comparison, unused_local_variable, curly_braces_in_flow_control_structures, unnecessary_new, unnecessary_this, unnecessary_brace_in_string_interps, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'dart:core';
import 'dart:io';

import 'package:fiyatby/Constant/constant.dart';
import 'package:fiyatby/classAi.dart';
import 'package:fiyatby/components/card.dart';
import 'package:fiyatby/models/map.dart';
import 'package:fiyatby/popup/fiyat_tahmin_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import '../Assets.dart';

final _formKey = GlobalKey<FormState>();

class FiyatTahmin extends StatefulWidget {
  FiyatTahmin(
      {required this.category, required this.image, required this.imageURL});
  File? image;
  String category;
  String imageURL;
  @override
  State<FiyatTahmin> createState() => _FiyatTahminState();
}

class _FiyatTahminState extends State<FiyatTahmin> {
  MapProvider map = MapProvider();

  var marka, markaAdi;
  var tip, tipAdi;
  var model, modeladi;
  var origin, originAdi;
  var drive, driveAdi;
  var yuzTanima, yuzTanimaAdi;
  var deceitOne, deceitOneAdi,multiOneAdi,multiOne;
  final MyServer myServer = MyServer();
  TextEditingController motor = TextEditingController();
  TextEditingController silindir = TextEditingController();
  TextEditingController beygir = TextEditingController();
  TextEditingController sehir = TextEditingController();
  TextEditingController otoyol = TextEditingController();
  TextEditingController ads = TextEditingController();
  // MyModelRunner? modelRunner;
  //bool modelLoaded = false;
  var selectedItem,
      selectedItemDrive,
      selectedItemOrigin,
      selectedItemType,
      selectedItemModel,
      selectedItemPcModel,
      selectedPcItem,
      selectedItemTfModel,
      selectedTfItem,
      selectedItemDeceit,selectedMulti,selectedItemMulti;

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
                              "Fiyat Tahmin",
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
                            decoration: BoxDecoration(
                              color: Constant.white,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.7,
                                      child: Image.file(
                                        widget.image!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Input(
                                      width: width,
                                      labelText: widget.category == 'phone'
                                          ? "Ram "
                                          : widget.category == 'car'
                                              ? "Motor Büyüklüğü"
                                              : "Ram",
                                      deger: motor,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Input(
                                      width: width,
                                      labelText: widget.category == 'phone'
                                          ? "Ön kamera Çözünürlüğü"
                                          : widget.category == 'car'
                                              ? "Silindirler"
                                              : "HD",
                                      deger: silindir,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Input(
                                      width: width,
                                      labelText: widget.category == 'phone'
                                          ? "Ekran Boyutu"
                                          : widget.category == 'car'
                                              ? "Beygir gücü"
                                              : "Ekran boyutu",
                                      deger: beygir,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Input(
                                      width: width,
                                      labelText: widget.category == 'phone'
                                          ? "Hafıza"
                                          : widget.category == 'car'
                                              ? "Şehir içi mol/galon"
                                              : "Hız",
                                      deger: sehir,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Visibility(
                                      visible: widget.category == "car" ||
                                          widget.category == "computer",
                                      child: Column(
                                        children: [
                                          Input(
                                            width: width,
                                            labelText:
                                                widget.category == "computer"
                                                    ? "Trend"
                                                    : "Otoyol mol/galon ",
                                            deger: otoyol,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Visibility(
                                              visible: widget.category == "car",
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: width * 1,
                                                    height: 55,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              filled: true,
                                                              hintStyle: TextStyle(
                                                                  color: Constant
                                                                      .dark),
                                                              hintText:
                                                                  "Mekanizasyon",
                                                              fillColor:
                                                                  Constant
                                                                      .white),
                                                      value: selectedItemDrive,
                                                      icon: SvgPicture.asset(
                                                          Assets.icons.galeri),
                                                      items: map
                                                          .driveTrainMap.keys
                                                          .map((String
                                                              drivetrain) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: drivetrain,
                                                          child:
                                                              Text(drivetrain),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (Selectedmekanizasyon) {
                                                        selectedItemDrive =
                                                            Selectedmekanizasyon;
                                                        int secilenMarkaNumarasi =
                                                            map.driveTrainMap[
                                                                selectedItemDrive]!;
                                                        drive =
                                                            secilenMarkaNumarasi;
                                                        driveAdi =
                                                            selectedItemDrive;
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bu alanı seçmek zorunludur';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: width * 1,
                                                    height: 55,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              filled: true,
                                                              hintStyle: TextStyle(
                                                                  color: Constant
                                                                      .dark),
                                                              hintText:
                                                                  "Üretim Yeri",
                                                              fillColor:
                                                                  Constant
                                                                      .white),
                                                      value: selectedItemOrigin,
                                                      icon: SvgPicture.asset(
                                                          Assets.icons.galeri),
                                                      items: map.originMap.keys
                                                          .map(
                                                              (String originn) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: originn,
                                                          child: Text(originn),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (Selectedorigin) {
                                                        selectedItemOrigin =
                                                            Selectedorigin;
                                                        int secilenMarkaNumarasi =
                                                            map.originMap[
                                                                selectedItemOrigin]!;
                                                        origin =
                                                            secilenMarkaNumarasi;
                                                        originAdi =
                                                            selectedItemOrigin;
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bu alanı seçmek zorunludur';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: width * 1,
                                                    height: 55,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              filled: true,
                                                              hintStyle: TextStyle(
                                                                  color: Constant
                                                                      .dark),
                                                              hintText: "Marka",
                                                              fillColor:
                                                                  Constant
                                                                      .white),
                                                      value: selectedItem,
                                                      icon: SvgPicture.asset(
                                                          Assets.icons.galeri),
                                                      items: map
                                                          .arabaMarkalari.keys
                                                          .map((String marka) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: marka,
                                                          child: Text(marka),
                                                        );
                                                      }).toList(),
                                                      onChanged: (yeniMarka) {
                                                        setState(() {
                                                          selectedItem =
                                                              yeniMarka;
                                                          int secilenMarkaNumarasi =
                                                              map.arabaMarkalari[
                                                                  selectedItem]!;
                                                          marka =
                                                              secilenMarkaNumarasi;
                                                          markaAdi =
                                                              selectedItem;
                                                        });

                                                        map.updateModels(
                                                            markaAdi);
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bu alanı seçmek zorunludur';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: width * 1,
                                                    height: 55,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              filled: true,
                                                              hintStyle: TextStyle(
                                                                  color: Constant
                                                                      .dark),
                                                              hintText: "Model",
                                                              fillColor:
                                                                  Constant
                                                                      .white),
                                                      value: selectedItemModel,
                                                      icon: SvgPicture.asset(
                                                          Assets.icons.galeri),
                                                      items: map.modelMap.keys
                                                          .map((String model) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: model,
                                                          child: Text(model),
                                                        );
                                                      }).toList(),
                                                      onChanged: (yeniModel) {
                                                        setState(() {
                                                          selectedItemModel =
                                                              yeniModel;
                                                          int secilenModelNumarasi =
                                                              map.modelMap[
                                                                  selectedItemModel]!;
                                                          model =
                                                              secilenModelNumarasi;
                                                          modeladi =
                                                              selectedItemModel;
                                                        });
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bu alanı seçmek zorunludur';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: width * 1,
                                                    height: 55,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              filled: true,
                                                              hintStyle: TextStyle(
                                                                  color: Constant
                                                                      .dark),
                                                              hintText: "Tip",
                                                              fillColor:
                                                                  Constant
                                                                      .white),
                                                      value: selectedItemType,
                                                      icon: SvgPicture.asset(
                                                          Assets.icons.galeri),
                                                      items: map.typeMap.keys
                                                          .map((String tipp) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: tipp,
                                                          child: Text(tipp),
                                                        );
                                                      }).toList(),
                                                      onChanged: (yeniTip) {
                                                        selectedItemType =
                                                            yeniTip;
                                                        int secilenMarkaNumarasi =
                                                            map.typeMap[
                                                                selectedItemType]!;
                                                        tip =
                                                            secilenMarkaNumarasi;
                                                        tipAdi =
                                                            selectedItemType;
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Bu alanı seçmek zorunludur';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                        visible: widget.category == "phone",
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: width * 1,
                                              height: 55,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    filled: true,
                                                    hintStyle: TextStyle(
                                                        color: Constant.dark),
                                                    hintText: "Marka",
                                                    fillColor: Constant.white),
                                                value: selectedPcItem,
                                                icon: SvgPicture.asset(
                                                    Assets.icons.galeri),
                                                items: map.telefonMarkalari.keys
                                                    .map((String marka) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: marka,
                                                    child: Text(marka),
                                                  );
                                                }).toList(),
                                                onChanged: (yeniMarka) {
                                                  setState(() {
                                                    selectedPcItem = yeniMarka;
                                                    int secilenMarkaNumarasi =
                                                        map.telefonMarkalari[
                                                            selectedPcItem]!;
                                                    marka =
                                                        secilenMarkaNumarasi;
                                                    markaAdi = selectedPcItem;
                                                  });

                                                  map.updatePcModels(markaAdi);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Bu alanı seçmek zorunludur';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 55,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    filled: true,
                                                    hintStyle: TextStyle(
                                                        color: Constant.dark),
                                                    hintText: "Model",
                                                    fillColor: Constant.white),
                                                value: selectedItemPcModel,
                                                icon: SvgPicture.asset(
                                                    Assets.icons.galeri),
                                                items: map.modelPcMap.keys
                                                    .map((String model) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: model,
                                                    child: Text(model),
                                                  );
                                                }).toList(),
                                                onChanged: (yeniModel) {
                                                  setState(() {
                                                    selectedItemPcModel =
                                                        yeniModel;
                                                    int secilenModelNumarasi =
                                                        map.modelPcMap[
                                                            selectedItemPcModel]!;
                                                    model =
                                                        secilenModelNumarasi;
                                                    modeladi =
                                                        selectedItemPcModel;
                                                  });
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Bu alanı seçmek zorunludur';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        )),
                                    Visibility(
                                      visible: widget.category == "computer",
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: width * 1,
                                            height: 55,
                                            child:
                                                DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  filled: true,
                                                  hintStyle: TextStyle(
                                                      color: Constant.dark),
                                                  hintText: "Cd girşi",
                                                  fillColor: Constant.white),
                                              value: selectedTfItem,
                                              icon: SvgPicture.asset(
                                                  Assets.icons.galeri),
                                              items: map.deceit.keys
                                                  .map((String deceit) {
                                                return DropdownMenuItem<String>(
                                                  value: deceit,
                                                  child: Text(deceit),
                                                );
                                              }).toList(),
                                              onChanged: (SelectedDeceit) {
                                                selectedItemDeceit =
                                                    SelectedDeceit;
                                                int secilenMarkaNumarasi =
                                                    map.deceit[
                                                        selectedItemDeceit]!;
                                                deceitOne =
                                                    secilenMarkaNumarasi;
                                                deceitOneAdi =
                                                    selectedItemDeceit;
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Bu alanı seçmek zorunludur';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                             SizedBox(
                                            width: width * 1,
                                            height: 55,
                                            child:
                                                DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  filled: true,
                                                  hintStyle: TextStyle(
                                                      color: Constant.dark),
                                                  hintText: "Çoklu giriş",
                                                  fillColor: Constant.white),
                                              value: selectedMulti,
                                              icon: SvgPicture.asset(
                                                  Assets.icons.galeri),
                                              items: map.deceit.keys
                                                  .map((String deceit) {
                                                return DropdownMenuItem<String>(
                                                  value: deceit,
                                                  child: Text(deceit),
                                                );
                                              }).toList(),
                                              onChanged: (SelectedMulti) {
                                                selectedItemMulti =
                                                    SelectedMulti;
                                                int secilenMarkaNumarasi =
                                                    map.deceit[
                                                        selectedItemMulti]!;
                                                multiOne =
                                                    secilenMarkaNumarasi;
                                                multiOneAdi =
                                                    selectedItemMulti;
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Bu alanı seçmek zorunludur';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                         
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 1,
                                      height: 55,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Constant.blueOne,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            var response = 4;
                                            //     await myServer.startServer(
                                            //   marka,
                                            //   model,
                                            //   tip,
                                            //   origin,
                                            //   drive,
                                            //   double.parse(motor.text),
                                            //   double.parse(silindir.text),
                                            //   double.parse(beygir.text),
                                            //   double.parse(sehir.text),
                                            //   double.parse(otoyol.text),
                                            // );

                                            // Yanıtı kullanabilirsiniz
                                            //print(response.body);

                                            // Sunucuyu durdurmak için
                                            // await myServer.stopServer();
                                            if (widget.category == 'car') {
                                              _openDialogTwo(
                                                  context,
                                                  response,
                                                  markaAdi,
                                                  modeladi,
                                                  tipAdi,
                                                  originAdi,
                                                  driveAdi,
                                                  motor.text,
                                                  silindir.text,
                                                  beygir.text,
                                                  sehir.text,
                                                  otoyol.text,
                                                  widget.image,
                                                  widget.imageURL,
                                                  widget.category);
                                            } else if (widget.category ==
                                                'phone') {
                                              _openDialogTf(
                                                  context,
                                                  response,
                                                  markaAdi,
                                                  modeladi,
                                                  motor.text,
                                                  silindir.text,
                                                  beygir.text,
                                                  sehir.text,
                                                  widget.image,
                                                  widget.imageURL,
                                                  widget.category);
                                            } else if (widget.category ==
                                                'computer') {
                                              _openDialogCp(
                                                  context,
                                                  response,
                                                  motor.text,
                                                  beygir.text,
                                                  deceitOneAdi,
                                                  sehir.text,
                                                  silindir.text,
                                                  otoyol.text,
                                                  multiOne,
                                                  widget.image,
                                                  widget.imageURL,
                                                  widget.category);


                                                  //context, fiyat, ram, ekran, cd, hiz, hd,trend, multi, image,imageURL, kategori
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Fiyat Tahmini Yap",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ]),
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

Future _openDialogTwo(context, fiyat, marka, model, type, origin, driveTrain,
        motor, silindir, beygir, sehir, otoyol, image, imageURL, kategori) =>
    showDialog(
        barrierDismissible: false,
        barrierColor: Constant.popat,
        context: context,
        builder: ((context) => TahminDialogPopat(
              fiyat: fiyat,
              beygir: beygir,
              driveTrain: driveTrain,
              marka: marka,
              model: model,
              type: type,
              origin: origin,
              motor: motor,
              otoyol: otoyol,
              sehir: sehir,
              silindir: silindir,
              image: image,
              imageURL: imageURL,
              kategori: kategori,
            )));
Future _openDialogTf(context, fiyat, marka, model, ram, onKamera, ekran, hafiza,
        image, imageURL, kategori) =>
    showDialog(
        barrierDismissible: false,
        barrierColor: Constant.popat,
        context: context,
        builder: ((context) => TahminDialogPopat(
              fiyat: fiyat,
              beygir: ekran,
              marka: marka,
              model: model,
              motor: ram,
              sehir: hafiza,
              silindir: onKamera,
              image: image,
              imageURL: imageURL,
              kategori: kategori,
            )));
Future _openDialogCp(context, fiyat, ram, ekran, cd, hiz, hd,trend, multi, image,
        imageURL, kategori) =>
    showDialog(
        barrierDismissible: false,
        barrierColor: Constant.popat,
        context: context,
        builder: ((context) => TahminDialogPopat(
              fiyat: fiyat,
              beygir: ekran,
              motor: ram,
              sehir: hiz,
              silindir: hd,
              otoyol: trend,
              cd:cd,
              multi:multi,
              image: image,
              imageURL: imageURL,
              kategori: kategori,
            )));

class Input extends StatelessWidget {
  String labelText;
  TextEditingController deger;

  Input({required this.width, required this.labelText, required this.deger});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 1,
      height: 65,
      decoration: _boxDecoration,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Bu alanı doldurmak zorunludur';
          }
          return null;
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: _fiedlDecoration.copyWith(
          labelText: labelText,
        ),
        controller: deger,
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
    errorStyle:
        TextStyle(height: 0), // Hata metninin yükseklik değerini 0 yapar
    errorMaxLines: 1, // Hata metnini tek satırda görüntüler
    labelText: "Kullanıcı Şifresi",
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Constant.dark,
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
    fillColor: Constant.white, //background

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
