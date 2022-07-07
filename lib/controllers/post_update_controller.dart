import 'package:blog_app_flutter/data/repository/post_update_repo.dart';
import 'package:blog_app_flutter/models/response_model.dart';
import 'package:blog_app_flutter/models/single_post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostUpdateController extends GetxController{
  final PostUpdateRepo postUpdateRepo;

  PostUpdateController({required this.postUpdateRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> updateData(String id, SinglePostModel singlePostModel) async{
    _isLoading = true;
    update();

    Response response = await postUpdateRepo.updateData(id, singlePostModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body['message']);
      Get.snackbar(
          'Successful!', response.body['message'],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }

    else{
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading=false;
    update();
    return responseModel;
  }
}