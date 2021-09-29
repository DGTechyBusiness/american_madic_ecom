import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/home/views/pages_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class SplashView extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
   // box.write('userId', '7');
    String isNewUser = box.read('isNewUser');

    Timer(Duration(seconds: 4), () {
      print('Loginstatus : $isNewUser');
      Get.offAll(PagesView());
      //need to fix
      // box.write('isNewUser', 'true');
      // // Get.to(LoginView());
      // if (isNewUser == 'true') {
      //   Get.offAll(PagesView());
      // } else {
      //   //Get.offAll(IntroPage());
      //   Get.offAll(LoginView());
      // }
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.white,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
