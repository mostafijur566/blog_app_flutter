import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:get/get.dart';

class GetCommentRepo extends GetxService{
  final ApiClient apiClient;
  GetCommentRepo({required this.apiClient});
  
  Future<Response> getComments(String id) async{
    return await apiClient.getData('get-comment/$id/');
  }
}