import 'dart:convert';
import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://brothshoes.otwlulus.com/public/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    String add,
    String timePick,
    String detailLoc,
    double totalPrice,
    double ongkir,
  ) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'categories_service': "pickup&delivery",
        'address': add,
        'time_pickup_delivery': timePick,
        'detail_lokasi': detailLoc,
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "pending",
        'total_price': totalPrice,
        'shipping_price': ongkir,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }

  Future<List<TransactionModel>> getTransaksi(UserModel token) async {
    var url = '$baseUrl/transactions';
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
      List data = jsonDecode(response.body)['data']['data'];
      List<TransactionModel> transaksi = [];

      for (var item in data) {
        transaksi.add(TransactionModel.fromJson(item));
      }
      return transaksi;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }

  Future<List<TransactionModel>> getAllTransaksi() async {
    var url = '$baseUrl/transactionsall';
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<TransactionModel> transaksi = [];

      for (var item in data) {
        transaksi.add(TransactionModel.fromJson(item));
      }
      return transaksi;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
