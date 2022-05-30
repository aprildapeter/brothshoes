import 'package:brothshoes/models/category_model.dart';
import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/models/transaction_item_model.dart';
import 'package:brothshoes/models/transaksi_product.dart';
import 'package:brothshoes/models/user_model.dart';

// class TransactionModel {
//   int id;
//   UserModel iduser;
//   String address;
//   String detail_lokasi;
//   String categories_service;
//   String time_pickup_delivery;
//   String totalPrice;
//   String shippingPrice;
//   String payment;
//   String status;

//   TransactionModel({
//     this.id,
//     this.iduser,
//     this.address,
//     this.detail_lokasi,
//     this.categories_service,
//     this.time_pickup_delivery,
//     this.totalPrice,
//     this.shippingPrice,
//     this.payment,
//     this.status,
//   });

//   TransactionModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     iduser = UserModel.fromJson(json['user']);
//     address = json['address'];
//     detail_lokasi = json['detail_lokasi'];
//     categories_service = json['categories_service'];
//     time_pickup_delivery = json['time_pickup_delivery'];
//     totalPrice = json['total_price'];
//     shippingPrice = json['shipping_price'];
//     payment = json['payment'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user': iduser.toJson(),
//       'address': address,
//       'detail_lokasi': detail_lokasi,
//       'categories_service': categories_service,
//       'time_pickup_delivery': time_pickup_delivery,
//       'total_price': totalPrice,
//       'shipping_price': shippingPrice,
//       'payment': payment,
//       'status': status,
//     };
//   }
// }

class TransactionModel {
  int id;
  String usersId;
  String categoriesService;
  String address;
  String detailLokasi;
  String timePickupDelivery;
  String totalPrice;
  String shippingPrice;
  String status;
  String payment;
  DateTime createdAt;
  DateTime updatedAt;
  List<TransactionItemModel> items;
  UserModel user;

  TransactionModel(
      {this.id,
      this.usersId,
      this.categoriesService,
      this.address,
      this.detailLokasi,
      this.timePickupDelivery,
      this.totalPrice,
      this.shippingPrice,
      this.status,
      this.payment,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.user});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    categoriesService = json['categories_service'];
    address = json['address'];
    detailLokasi = json['detail_lokasi'];
    timePickupDelivery = json['time_pickup_delivery'];
    totalPrice = json['total_price'];
    shippingPrice = json['shipping_price'];
    status = json['status'];
    payment = json['payment'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    if (json['items'] != null) {
      items = <TransactionItemModel>[];
      json['items'].forEach((v) {
        items.add(TransactionItemModel.fromJson(v));
      });
    }
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['users_id'] = usersId;
    data['categories_service'] = categoriesService;
    data['address'] = address;
    data['detail_lokasi'] = detailLokasi;
    data['time_pickup_delivery'] = timePickupDelivery;
    data['total_price'] = totalPrice;
    data['shipping_price'] = shippingPrice;
    data['status'] = status;
    data['payment'] = payment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}
