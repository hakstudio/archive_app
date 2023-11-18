import 'dart:convert';

import 'package:archive_app/model/user.dart';
import 'package:archive_app/service/rest_api.dart';

class UserVM {
  String _url = "localhost:8080";
  String _path = "users";
  RestApi _restApi = RestApi();

  Future<List<User>> getUsers() async {
    String json = await _restApi.get(_url, _path);
    Iterable i = jsonDecode(json);
    return List<User>.from(i.map((e) => User.fromJson(e)));
  }

  Future<User> addUser(User user) async {
    String json = await _restApi.post(_url, _path, user.toJson());
    return User.fromJson(jsonDecode(json));
  }

  Future<User> getUser(int userId) async {
    String json = await _restApi.get(_url, _path + "/$userId");
    return User.fromJson(jsonDecode(json));
  }

  Future<User> updateUser(int userId, User user) async {
    String json = await _restApi.put(_url, _path + "/$userId", user.toJson());
    return User.fromJson(jsonDecode(json));
  }

  Future<String> deleteUser(int userId) async {
    String json = await _restApi.get(_url, _path + "/$userId");
    return json;
  }
}
