import 'package:blog_app_flutter/data/repository/single_post_repo.dart';
import 'package:blog_app_flutter/models/single_post_model.dart';
import 'package:get/get.dart';

class SinglePostController extends GetxController{
  final SinglePostRepo singlePostRepo;
  SinglePostController({required this.singlePostRepo});

  int? postId;
  String? title;
  String? body;
  String? postDate;
  String? user;
  int? categoryId;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getData(String id) async{
    Response response = await singlePostRepo.getData(id);

    if(response.statusCode == 200){
      postId = SinglePostModel.fromJson(response.body).id;
      title = SinglePostModel.fromJson(response.body).title;
      body = SinglePostModel.fromJson(response.body).body;
      postDate = SinglePostModel.fromJson(response.body).postDate;
      user = SinglePostModel.fromJson(response.body).user;
      categoryId = SinglePostModel.fromJson(response.body).categoryId;

      _isLoading = true;
      print('got single post');
      update();
    }
    else{
      print('something went wrong cannot get post');
    }
  }
}