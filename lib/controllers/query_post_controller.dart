import 'package:blog_app_flutter/data/repository/query_post_repo.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class QueryPostController extends GetxController{
  final QueryPostRepo queryPostRepo;
  QueryPostController({required this.queryPostRepo});

  List<dynamic> _allPostList = [];
  List<dynamic> get allPostList => _allPostList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getData(String id) async{
    Response response = await queryPostRepo.getData(id);
    if(response.statusCode == 200){
      _allPostList = [];
      _allPostList.addAll(Post.fromJson(response.body).allPosts);
      _isLoading = true;
      update();
    }
    else{
      print('shit!');
    }
  }
}