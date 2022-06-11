import 'package:blog_app_flutter/data/repository/user_repo.dart';
import 'package:get/get.dart';

import '../models/user_info_model.dart';

class UserController extends GetxController{
  final UserRepo userRepo;
  UserController({required this.userRepo});

  String ? name;
  String ? email;
  String ? username;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUserInfo() async{
    Response response = await userRepo.getUserInfo();
    if(response.statusCode == 200){
      name = UserInfoModel.fromJson(response.body).name;
      email = UserInfoModel.fromJson(response.body).email;
      username = UserInfoModel.fromJson(response.body).username;
      _isLoading = true;
      update();
    }
    else{
      print(response.statusCode);
    }
  }
}