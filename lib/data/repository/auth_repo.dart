import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/models/signin_body.dart';
import 'package:blog_app_flutter/models/signup_body.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async{
    return await apiClient.post(AppConstants.REGISTER_ENDPOINT, signUpBody.toJson());
  }

  Future<Response> login(SignInBody signInBody) async{
    return await apiClient.post(AppConstants.LOGIN_ENDPOINT, signInBody.toJson());
  }

  Future<bool> saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveEmailAndPassowrd(String email, String password) async{
    try{
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }
    catch(e){
      throw e;
    }
  }
}