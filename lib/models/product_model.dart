
import 'package:brothshoes/models/category_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String url;
  CategoryModel category;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.url,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    url = json['url'];
    category = CategoryModel.fromJson(json['category']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'url': url,
      'category': category.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
