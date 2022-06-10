import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:get/get.dart';

class PostRepo extends GetxService{
  final ApiClient apiClient;
  PostRepo({required this.apiClient});

  Future<Response> getPost() async{
    return await apiClient.getData(AppConstants.POST_ENDPOINT);
  }

  Future<Response> getPostByCategory(String id) async{
    return await apiClient.getData('get-post-by-category/$id');
  }
}