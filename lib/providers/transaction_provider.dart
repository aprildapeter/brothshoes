import 'package:brothshoes/models/cart_model.dart';
import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<void> getTransaksi({UserModel token}) async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getTransaksi(token);

      _transactions = transactions;
      //return true;
    } catch (e) {
      print(e);
      //return false;
    }
  }

  Future<void> getAllTransaksi() async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getAllTransaksi();

      _transactions = transactions;
      //return true;
    } catch (e) {
      print(e);
      //return false;
    }
  }

  // Future<bool> getAllTransaksi() async {
  //   try {
  //     List<TransactionModel> transactions =
  //         await TransactionService().getAllTransaksi();

  //     _transactions = transactions;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

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
    String token,
    List<CartModel> carts,
    String add,
    String timePick,
    String detailLoc,
    double totalPrice,
    double ongkir,
  ) async {
    try {
      if (await TransactionService().checkout(
        token,
        carts,
        add,
        timePick,
        detailLoc,
        totalPrice,
        ongkir,
      )) {
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
