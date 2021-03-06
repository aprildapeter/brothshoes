import 'dart:convert';

import 'package:brothshoes/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://brothshoes.otwlulus.com/public/api';

  Future<UserModel> register({
    String name,
    String phone,
    String email,
    String password,
    String address,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
    String token,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      saveToken(user.token);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  saveToken(String t) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString("token", t);
  }

  Future<UserModel> logout({
    String token,
  }) async {
    var url = '$baseUrl/logout';
    var headers = {'Content-Type': 'application/json', 'Content-Type': token};
    var body = jsonEncode({});

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = user.token;

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> getUser(String token) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal Get User');
    }
  }
}
