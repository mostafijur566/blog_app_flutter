import 'package:blog_app_flutter/data/repository/do_comment_repo.dart';
import 'package:blog_app_flutter/models/do_comment_model.dart';
import 'package:blog_app_flutter/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoCommentController extends GetxController{
  final DoCommentRepo doCommentRepo;

  DoCommentController({required this.doCommentRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> doComment(DoCommentModel doCommentModel) async{
    _isLoading = true;
    update();

    Response response = await doCommentRepo.doComment(doCommentModel);
    late ResponseModel responseModel;

    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body['message']);
      String message = response.body['message'];
      Get.snackbar(
          'Successful!', message,
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar(
          'Error!', 'Something went wrong! Try again later',
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}