import 'package:blog_app_flutter/data/repository/category_repo.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController{
  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});

  List<dynamic> _categories = [];
  List<dynamic> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCategoryList() async{
    Response response = await categoryRepo.getCategory();
    if(response.statusCode == 200){
      _categories = [];
      _categories.addAll(Category.fromJson(response.body).categories);
      print(_categories[0].name);
      _isLoading = true;
      update();
    }
    else{
      print(response.statusCode);
    }
  }

}