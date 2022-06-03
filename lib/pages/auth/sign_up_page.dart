import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              AppTextField(
                hintText: 'Username',
                icon: Icons.credit_card,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              AppTextField(
                hintText: 'Name',
                icon: Icons.person,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              AppTextField(
                hideText: true,
                hintText: 'Password',
                icon: Icons.password_sharp,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: screenWidth / 2,
                height: screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.3),
                    color: Colors.white),
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
                height: screenHeight * 0.03,
              ),
              RichText(
                text: TextSpan(
                    text: 'Have an account already?',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
