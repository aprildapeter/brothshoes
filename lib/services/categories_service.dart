import 'dart:convert';
import 'package:brothshoes/models/category_model.dart';
import 'package:brothshoes/models/product_model.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  String baseUrl = 'http://brothshoes.otwlulus.com/public/api';

  Future<List<CategoryModel>> getCategories() async {
    var url = '$baseUrl/categories';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }

      return categories;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
