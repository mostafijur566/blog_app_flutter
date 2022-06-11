import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo extends GetxService{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.GET_USER_INFO);
  }
}