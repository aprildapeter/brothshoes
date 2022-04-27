import 'package:brothshoes/services/logout_service.dart';
import 'package:flutter/cupertino.dart';

class LogoutProvider with ChangeNotifier {
  Future<bool> logout(
      String token) async {
    try {
      if (await LogoutService().logout(token)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}