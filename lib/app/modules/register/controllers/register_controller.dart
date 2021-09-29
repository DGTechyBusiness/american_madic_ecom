import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/modules/register/providers/regiseter_api.dart';
import 'package:shree_pharmacy/app/modules/register/views/register_view.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/loading_components.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print('date is: ${dobController.text}');
  }

  getRegister() async {
    LoadingComponent.alertDialog('Loading, please wait', '');

    var response = await RegisterApi.regisetrFunc(
        nameController.text.trim(),
        mobileController.text.trim(),
        emailController.text.trim(),
        dobController.text.trim(),
        passwordController.text.trim());

    print('register controller response: ${response.message}');
    if (response != null) {
      if (response.status == 1 && response.message == 'Successfully added with us')
      {
        Get.back();
        Get.back();
        MySnackbar.successSnackBar('Registration Success', 'Register successfully, Please login to the app');
        //Get.off(() => LoginView());
      } else if (response.message == 'Email address is already register\n')
      {
        Get.back();
        MySnackbar.infoSnackBar(
            'User already exist', 'Please try with different email and number');
      }
      else {
        Get.back();
        MySnackbar.errorSnackBar(
            'Registration failed', 'Server down, please try again later');
      }
    }
  }
}
