import 'package:blog_app_flutter/models/signin_body.dart';
import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void _login(AuthController authController) {

    String email = emailController.text.toLowerCase().trim();
    String password = passwordController.text;

    if (email.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Email field cannot be empty!',
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
      SignInBody signInBody = SignInBody(username: email, password: password);
      authController.login(signInBody).then((status){
        if(status.isSuccess){
          Get.offNamed(RouteHelper.getInitial());
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
        child:  GetBuilder<AuthController>(builder: (_authController){
          return !_authController.isLoading ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  height: screenHeight * 0.05,
                ),

                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: screenHeight * 0.09,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),

                      Text(
                          'Sign into your account',
                          style: TextStyle(
                              fontSize: screenHeight * 0.025,
                              color: Colors.white
                          )
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),

                    ],
                  ),
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
                    hideText: true,
                    hintText: 'Password',
                    icon: Icons.password_sharp,
                    controller: passwordController
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                GestureDetector(
                  onTap: (){
                    _login(_authController);
                  },
                  child: Container(
                    width: screenWidth / 2,
                    height: screenHeight / 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(RouteHelper.getSignUpPage()),
                          text: ' Create',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                      ]
                  ),

                ),
              ],
            ),
          ) :
          const Center(child: CircularProgressIndicator(color: Colors.white,));
        })
      ),
    );
  }
}
