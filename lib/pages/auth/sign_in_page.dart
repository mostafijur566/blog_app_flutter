import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
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

            // AppTextField(hintText: 'Email', icon: Icons.email),
            // SizedBox(
            //   height: screenHeight * 0.02,
            // ),
            // AppTextField(hideText: true, hintText: 'Password', icon: Icons.password_sharp),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
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
                      //recognizer: //TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage()),
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
      ),
    );
  }
}
