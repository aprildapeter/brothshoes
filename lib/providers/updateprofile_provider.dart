import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/services/auth_service.dart';
import 'package:brothshoes/services/updateprofile_service.dart';
import 'package:flutter/cupertino.dart';

class UpdateProfileProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> update({
    String name,
    String phone,
    String address,
    String token,
  }) async {
    try {
      UserModel user = await UpdateProfileService().update(
        token: token,
        name: name,
        phone: phone,
        address: address,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
