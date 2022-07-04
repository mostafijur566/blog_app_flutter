import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/models/do_comment_model.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:get/get.dart';

class DoCommentRepo extends GetxService{
  final ApiClient apiClient;
  DoCommentRepo({required this.apiClient});

  Future<Response> doComment(DoCommentModel doCommentModel) async{
    return await apiClient.postData(AppConstants.DO_COMMENT_ENDPOINT, doCommentModel.toJson());
  }
}