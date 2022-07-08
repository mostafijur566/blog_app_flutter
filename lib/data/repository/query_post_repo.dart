import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:get/get.dart';

class QueryPostRepo extends GetxService{
  final ApiClient apiClient;
  QueryPostRepo({required this.apiClient});
  
  Future<Response> getData(String id) async{
    return await apiClient.getData('get-filter-post/$id/');
  }
}