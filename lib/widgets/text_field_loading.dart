import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/colors.dart';

class TextFieldLoading extends StatelessWidget {
  const TextFieldLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,
          top: 10,
          bottom: 10
      ),

      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2
            ),
          ]
      ),
      child: const SpinKitThreeInOut(color: AppColors.mainColor,)
    );
  }
}
