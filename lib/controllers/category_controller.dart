import 'package:blog_app_flutter/data/repository/category_repo.dart';
import 'package:flutter/material.dart';
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
    Response response = await categoryRepo.getData();
    if(response.statusCode == 200){
      _categories = [];
      _categories.addAll(Category.fromJson(response.body).categories);
      _isLoading = true;
      update();
    }
    else{
      Get.snackbar('Error!', 'Please check your internet connection!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent
      );
    }
  }

}