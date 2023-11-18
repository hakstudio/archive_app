import 'dart:convert';

import 'package:http/http.dart' as http;

class RestApi {
  Map<String,String> headers={
    "Content-Type":"application/json",
  };

  Future<String> get(String url, String path) async {
    Uri uri = Uri.http(url, path);
    final response = await http.get(uri,headers: headers);
    return response.body;
  }

  Future<String> post(
      String url, String path, Map<String, dynamic> body) async {
    Uri uri = Uri.http(url, path);
    final response = await http.post(uri, body: jsonEncode(body),headers: headers);
    return response.body;
  }

  Future<String> put(String url, String path, Map<String, dynamic> body) async {
    Uri uri = Uri.http(url, path);
    final response = await http.put(uri, body: jsonEncode(body),headers: headers);
    return response.body;
  }

  Future<String> delete(
      String url, String path, Map<String, dynamic> body) async {
    Uri uri = Uri.http(url, path);
    final response = await http.delete(uri, body: jsonEncode(body),headers: headers);
    return response.body;
  }
}
