import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({Key? key,
    required this.hintText,
    required this.icon,
    this.hideText = false
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Color(0xFFE5E3F1).withOpacity(0.2),
          ),
        ],
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        obscureText: hideText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.mainColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                width: 1.0,
                color: Colors.white
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
      ),
    );
  }
}
