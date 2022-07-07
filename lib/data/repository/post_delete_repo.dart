import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:get/get.dart';

class PostDeleteRepo extends GetxService{
  final ApiClient apiClient;
  PostDeleteRepo({required this.apiClient});
  
  Future<Response> deleteData(String id) async{
    return await apiClient.deleteData('delete-post/$id/');
  }
}