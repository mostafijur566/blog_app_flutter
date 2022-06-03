import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommentTextField extends StatelessWidget {
  CommentTextField({Key? key,
    required this.hintText,
    required this.icon
  }) : super(key: key);

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.dividerColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        minLines: 1,
        maxLines: 5,
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
                  color: AppColors.userNameColor
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.userNameColor
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
