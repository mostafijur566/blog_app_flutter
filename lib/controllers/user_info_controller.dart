import 'package:blog_app_flutter/data/repository/user_info_repo.dart';
import 'package:blog_app_flutter/models/user_info_model.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController{
  final UserInfoRepo userInfoRepo;
  UserInfoController({required this.userInfoRepo});

  String ? name;
  String ? username;
  int ? totalPost;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUserInfo(String user) async{
    Response response = await userInfoRepo.getUserInfo(user);

    if(response.statusCode == 200){
      name = UserInfoModel.fromJson(response.body).name;
      username = UserInfoModel.fromJson(response.body).username;
      totalPost = UserInfoModel.fromJson(response.body).totalPost;

      print('successfully!');
      _isLoading = true;
      update();
    }
    else{
      print('something went wrong cannot get user info');
    }
  }
}