import 'package:day3/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicesHandler {
  Future<dynamic> httpGet(String endPoint,
      {Map<String, String> headers}) async {
    Uri uri = Uri.parse('${Constants.BASE_HOST}$endPoint');
    Map<String, String> requestHeaders = {};
    if (headers != null) {
      requestHeaders = headers;
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }
    http.Response response = await http.get(uri, headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode >= 500) {
      throw Exception("Something wrong happened!");
    }
  }

  Future<dynamic> httpPost(
      {@required String endPoint,
      Map<String, String> headers,
      Map<String, String> body}) async {
    try {
      Uri uri = Uri.parse('${Constants.BASE_HOST}${endPoint}');
      Map<String, String> reqHeaders = headers ?? {};
      Map<String, String> reqBody = body ?? {};

      http.Response response =
          await http.post(uri, headers: reqHeaders, body: reqBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("post success");
        return jsonDecode(response.body);
      } else {
        throw Exception("Something wrong happened!");
      }
    } catch (err) {
      print("error");
    }
  }
}

/*
request:
url,
method,
headers,
body

response:
status code,
headers,
body (String)
*/
