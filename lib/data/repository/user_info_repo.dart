import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:get/get.dart';

class UserInfoRepo extends GetxService{
  final ApiClient apiClient;
  UserInfoRepo({required this.apiClient});

  Future<Response> getUserInfo(String user) async{
    print(user);
    return await apiClient.getData("get-other-user/$user/");
  }
}