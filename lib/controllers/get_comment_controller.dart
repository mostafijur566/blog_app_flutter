import 'package:blog_app_flutter/data/repository/get_comment_repo.dart';
import 'package:get/get.dart';

import '../models/comment_model.dart';

class GetCommentController extends GetxController{
  final GetCommentRepo getCommentRepo;
  GetCommentController({required this.getCommentRepo});

  List<dynamic> _comments = [];
  List<dynamic> get comments => _comments;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getComments(String id) async {
    Response response = await getCommentRepo.getComments(id);
    if(response.statusCode == 200){
      _comments = [];
      _comments.addAll(CommentModel.fromJson(response.body).comment);
      _isLoading = true;
      print('all comments got');
      update();
    }

    else{
      print(response.statusCode);
    }
  }
}