import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  Future<List<dynamic>> getData({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there was a problem , statusCode = ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': "Bearer $token",
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    header.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          " there was an error with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }

  Future<dynamic> put(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> header = {};
    header.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (token != null) {
      header.addAll({
        'Authorization': "Bearer $token",
      });
    }
    print('body : '  ) ;
    print( body  ) ;
    print ('url : $url') ;
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          " there was an error with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}
