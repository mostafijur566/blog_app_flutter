import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/models/single_post_model.dart';
import 'package:get/get.dart';

class PostUpdateRepo extends GetxService{
  final ApiClient apiClient;
  
  PostUpdateRepo({required this.apiClient});
  
  Future<Response> updateData(String id, SinglePostModel singlePostModel) async{
    return await apiClient.updateData('update-blog/$id/', singlePostModel.toJson());
  }
}