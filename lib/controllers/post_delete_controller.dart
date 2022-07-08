import 'package:blog_app_flutter/data/repository/post_delete_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDeleteController extends GetxController{
  final PostDeleteRepo postDeleteRepo;
  PostDeleteController({required this.postDeleteRepo});

  Future<void> deleteData(String id) async{
    Response response = await postDeleteRepo.deleteData(id);

    if(response.statusCode == 200){
      String message = response.body['message'];
      Get.snackbar(
          'Successful!', message,
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }

    else{
      Get.snackbar('Oops!', "Couldn't delete the blog!");
    }
  }
}