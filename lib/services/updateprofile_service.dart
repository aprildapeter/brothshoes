import 'dart:convert';

import 'package:brothshoes/models/user_model.dart';
import 'package:http/http.dart' as http;

class UpdateProfileService {
  String baseUrl = 'http://brothshoes.otwlulus.com/public/api';
  Future<UserModel> update({
    String name,
    String phone,
    String address,
    String token,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'name': name,
      'phone': phone,
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
      UserModel user = UserModel.fromJson(data['user.id']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Update');
    }
  }
}

