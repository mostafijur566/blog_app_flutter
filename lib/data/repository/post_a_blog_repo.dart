import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/models/post_a_blog_model.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PostABlogRepo extends GetxService{
  final ApiClient apiClient;
  PostABlogRepo({required this.apiClient});
  
  Future<Response> postData(PostABlogModel postABlogModel) async{
    return await apiClient.postData(AppConstants.POST_BLOG_ENDPOINT, postABlogModel.toJson());
  }
}