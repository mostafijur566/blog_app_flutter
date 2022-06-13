import 'package:blog_app_flutter/data/repository/post_a_blog_repo.dart';
import 'package:blog_app_flutter/models/post_a_blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';

class PostABlogController extends GetxController{
  final PostABlogRepo postABlogRepo;

  PostABlogController({required this.postABlogRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> postBlog (PostABlogModel postABlogModel) async{
    _isLoading = true;
    update();
    Response response = await postABlogRepo.postData(postABlogModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      if(response.body['message'] !=400) {
        responseModel = ResponseModel(true, response.body["message"]);
        String message;
        message = response.body['message'];
        Get.snackbar(
            'Success!', message,
            colorText: Colors.white,
            backgroundColor: Colors.green
        );
      }
      else{
        responseModel = ResponseModel(false, 'Something went wrong! Try again later');
        Get.snackbar(
            'Error!', 'Something went wrong! Try again later',
            colorText: Colors.white,
            backgroundColor: Colors.green
        );
        print(response.body);
      }
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
      //print(response.statusCode);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
}