import 'package:http/http.dart' as http;


class LogoutService{
  String baseUrl = 'http://brothshoes.otwlulus.com/public/api';
Future<bool> logout(
      String token) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };


    var response = await http.post(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Logout!');
    }
  }
}