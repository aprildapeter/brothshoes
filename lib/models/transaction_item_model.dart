import 'package:brothshoes/models/product_model.dart';

class TransactionItemModel {
  int id;
  String usersId;
  String productsId;
  String transactionsId;
  String quantity;
  DateTime createdAt;
  DateTime updatedAt;
  ProductModel product;

  TransactionItemModel(
      {this.id,
      this.usersId,
      this.productsId,
      this.transactionsId,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.product});

  TransactionItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    productsId = json['products_id'];
    transactionsId = json['transactions_id'];
    quantity = json['quantity'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['users_id'] = usersId;
    data['products_id'] = productsId;
    data['transactions_id'] = transactionsId;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product.toJson();
    }
    return data;
  }
}
