import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/models/signup_body.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../routes/route_helper.dart';
import '../../widgets/app_text_field.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _registration(AuthController authController) {

    String email = emailController.text.toLowerCase().trim();
    String user = userController.text.trim();
    String name = nameController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Email field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (user.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Username field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (name.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Name field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.length <= 6) {
      Get.snackbar(
        'Oops!',
        'Password length should be at least 6 character!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else{
      SignUpBody signUpBody = SignUpBody(name: name, email: email, username: user, password: password);
      authController.registration(signUpBody).then((status){
        if(status.isSuccess){
          print("Success registration");
        }
        else{
          print(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: GetBuilder<AuthController>(builder: (_authController){
          return !_authController.isLoading ? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Container(
                  height: screenHeight * 0.2,
                  child: const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      backgroundColor: Colors.white,
                      radius: 80,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                AppTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                AppTextField(
                  hintText: 'Username',
                  icon: Icons.credit_card,
                  controller: userController,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                AppTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  controller: nameController,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                AppTextField(
                  hideText: true,
                  hintText: 'Password',
                  icon: Icons.password_sharp,
                  controller: passwordController,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    _registration(_authController);
                  },
                  child: Container(
                    width: screenWidth / 2,
                    height: screenHeight / 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.3),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(RouteHelper.getSignInPage()),
                    text: 'Have an account already?',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ) :
          Center(child: CircularProgressIndicator(color: Colors.white,));
        })
      ),
    );
  }
}
