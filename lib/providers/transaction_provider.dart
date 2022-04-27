import 'package:brothshoes/models/cart_model.dart';
import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  set products(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<bool> getTransaksi({UserModel token}) async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getTransaksi(token);

     _transactions = transactions;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<void> getTransaksi(String token) async {
  //   try {
  //     List<TransactionModel> transactions =
  //         await TransactionService().getTransaksi(token);
  //     _transactions = transactions;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
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
