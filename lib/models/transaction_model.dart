import 'package:brothshoes/models/transaksi_product.dart';
import 'package:brothshoes/models/user_model.dart';

class TransactionModel {
  int id;
  UserModel iduser;
  String address;
  String detail_lokasi;
  String categories_service;
  String time_pickup_delivery;
  String totalPrice;
  String shippingPrice;
  String payment;
  String status;

  TransactionModel({
    this.id,
    this.iduser,
    this.address,
    this.detail_lokasi,
    this.categories_service,
    this.time_pickup_delivery,
    this.totalPrice,
    this.shippingPrice,
    this.payment,
    this.status,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iduser = UserModel.fromJson(json['user']);
    address = json['address'];
    detail_lokasi = json['detail_lokasi'];
    categories_service = json['categories_service'];
    time_pickup_delivery = json['time_pickup_delivery'];
    totalPrice = json['total_price'];
    shippingPrice = json['shipping_price'];
    payment = json['payment'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': iduser.toJson(),
      'address': address,
      'detail_lokasi': detail_lokasi,
      'categories_service': categories_service,
      'time_pickup_delivery': time_pickup_delivery,
      'total_price': totalPrice,
      'shipping_price': shippingPrice,
      'payment': payment,
      'status': status,
    };
  }
}
