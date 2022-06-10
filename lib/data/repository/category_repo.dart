import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:get/get.dart';

class CategoryRepo extends GetxService{
  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});
  
  Future<Response> getCategory() async{
    return await apiClient.getCategory(AppConstants.CATEGORY_ENDPOINT);
  }
}