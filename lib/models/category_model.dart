class CategoryModel {
  int id;
  String name;
  String priceitems;
  String description_items;
  String img_url;
  DateTime createdAt;
  DateTime updatedAt;

  CategoryModel({
    this.id,
    this.priceitems,
    this.description_items,
    this.img_url,
    this.createdAt,
    this.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    priceitems = json['price_items '];
    description_items = json['description_items '];
    img_url = json['img_url'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price_items ': priceitems,
      'description_items ': description_items,
      'img_url': img_url,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
