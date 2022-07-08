import 'package:blog_app_flutter/data/repository/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../models/post_model_category.dart';

class PostController extends GetxController{
  final PostRepo postRepo;
  PostController({required this.postRepo});

  List<dynamic> _allPostsList = [];
  List<dynamic> get allPostsList => _allPostsList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _logout = false;
  bool get logout => _logout;

  Future<void> getPosts() async{
    Response response = await postRepo.getPost();
    if(response.statusCode == 200){
      _allPostsList = [];
      _allPostsList.addAll(Post.fromJson(response.body).allPosts);
      _isLoading = true;
      update();
    }
    else{
      if(response.statusCode == 401){
        _logout = true;
        update();
      }
    }
  }

  Future<void> getPostByCategory(String id) async{
    Response response = await postRepo.getPostByCategory(id);
    if(response.statusCode == 200){
      _allPostsList = [];
      _allPostsList.addAll(PostCategory.fromJson(response.body).allPosts);
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