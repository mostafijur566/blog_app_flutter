import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:get/get.dart';

class SinglePostRepo extends GetxService{
  final ApiClient apiClient;

  SinglePostRepo({required this.apiClient});

  Future<Response> getData(String id) async{
    return await apiClient.getData('get-single-blog/$id/');
  }
}