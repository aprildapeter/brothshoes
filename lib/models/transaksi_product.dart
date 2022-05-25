import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/models/user_model.dart';

class TransactionProduct {
  int id;
  int userid;
  int productid;
  int transactionsid;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  TransactionProduct({
    this.id,
    this.userid,
    this.productid,
    this.transactionsid,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  TransactionProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['users_id'];
    productid = json['product_id'];
    transactionsid = json['transactions_id'];
    quantity = json['quantity'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users_id': userid,
      'product_id': productid,
      'transaction_sid': transactionsid,
      'quantity': quantity,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
