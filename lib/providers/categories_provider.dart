import 'package:brothshoes/models/category_model.dart';
import 'package:brothshoes/services/categories_service.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  set categories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<void> getCategories() async {
    try {
      List<CategoryModel> categories = await CategoriesService().getCategories();
      _categories = categories;
    } catch (e) {
      print(e);
    }
  }
}
