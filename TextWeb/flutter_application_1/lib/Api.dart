import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/textmodel.dart';

class Api {
  final String urlsave = "http://localhost:8080/save";
  final String urlnewtext = "http://localhost:8080/newtext";
  //verileri mongoya kaydetmek icin
  Future<String> saveTexts(Map<String, String> models) async {
    //Map<String, List<String>>? data = {"texts": models};
    int id = 1;

    var body = json.encode(models);
    var response = await http.post(
      Uri.parse(urlsave),
      body: models,
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      var j = response.body;

      String giris = j.toString();

      return "tamam";
    } else {
      return "baglanamadi";
    }
  }

//yeni olusturulan yaziyi almak icin
  Future<String> newTexts(Map<String, String> models) async {
    //Map<String, List<String>>? data = {"texts": models};
    int id = 1;

    var body = json.encode(models);
    var response = await http.post(
      Uri.parse(urlnewtext),
      body: models,
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      var j = response.body;

      String giris = j.toString();

      return giris;
    } else {
      return "baglanamadi";
    }
  }
}
