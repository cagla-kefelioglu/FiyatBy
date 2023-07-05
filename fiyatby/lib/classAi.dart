// ignore_for_file: unused_local_variable, avoid_print

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyServer {
  HttpServer? _server;

  Future<dynamic> startServer(
    int make,
    int modell,
    int type,
    int origin,
    int driveTrain,
    double engineSize,
    double cylinders,
    double horsepower,
    double mPGCity,
    double mPGHighway,
  ) async {
    _server = await HttpServer.bind('192.168.1.37', 8000);
    if (_server != null) {
      print('Sunucu dinleniyor: ${_server!.address}:${_server!.port}');
      await http.Client().post(
            Uri.parse('http://192.168.1.37:8000/'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({"deneme":"SAsdhfgsjhg"}),
          );


      //sıkıntı 

      await for (var request in _server!) {
        print("DENEMEEE");
        try {
          var inputJson = await utf8.decoder.bind(request).join();
          var inputData = jsonDecode(inputJson);

          var inputDataMake = inputData['make'];
          var inputDataModel = inputData['model'];
          var inputDataType = inputData['type'];
          var inputDataOrigin = inputData['origin'];
          var inputDataDriveTrain = inputData['driveTrain'];
          var inputDataEngineSize = inputData['engineSize'];
          var inputDataCylinders = inputData['cylinders'];
          var inputDataHorsepower = inputData['horsepower'];
          var inputDataMPGCity = inputData['mPGCity'];
          var inputDataMPGHighway = inputData['mPGHighway'];

          // Verileri güncelleme
          inputData['make'] = make;
          inputData['modell'] = modell;
          inputData['type'] = type;
          inputData['origin'] = origin;
          inputData['driveTrain'] = driveTrain;
          inputData['engineSize'] = engineSize;
          inputData['cylinders'] = cylinders;
          inputData['horsepower'] = horsepower;
          inputData['mPGCity'] = mPGCity;
          inputData['mPGHighway'] = mPGHighway;

          var updatedJson = jsonEncode(inputData);

          var response = await http.post(
            Uri.parse('http://localhost:8000/predict'),
            headers: {'Content-Type': 'application/json'},
            body: updatedJson,
          );

          request.response
            ..headers.contentType = ContentType.json
            ..write(response.body)
            ..close();

          print(response);

          return response;
        } catch (e) {
          print('Sunucu hatası: $e');
        }
      }
    } else {
      print('Sunucu başlatılamadı!');
      throw Exception('Sunucu başlatılamadı!');
    }

    throw Exception('İşlem tamamlanamadı!');
  }

  Future<void> stopServer() async {
    await _server?.close(force: true);
    _server = null;
  }
}
