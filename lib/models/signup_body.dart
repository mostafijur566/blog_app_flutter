import 'package:blog_app_flutter/pages/auth/sign_up_page.dart';

class SignUpBody{
  String name;
  String email;
  String username;
  String password;

  SignUpBody({
   required this.name,
   required this.email,
   required this.username,
   required this.password
});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["username"] = this.username;
    data["password"] = this.password;
    return data;
  }
}