import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> get({required String url ,  @required String? token}) async {
    Map<String, String> headers = {};
if (token != null) {
    headers.addAll({
      'Authorization': "Bearer $token",
    });
};

    http.Response response = await http.get(Uri.parse(url) , headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem in status code ${response.statusCode}');
    }
  }


}



// Future<dynamic> get({required String url, @required String? token}) async {
//   Dio dio = Dio();
//   dio.options.headers = {'Content-Type': 'application/json'};
  
//   if (token != null) {
//     dio.options.headers['Authorization'] = 'Bearer $token';
//   }

//   try {
//     Response response = await dio.get(url);
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       throw Exception('There is a problem in status code ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Failed to fetch data: $e');
//   }
// }
