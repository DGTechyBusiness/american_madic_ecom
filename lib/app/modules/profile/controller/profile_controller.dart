import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shree_pharmacy/app/modules/profile/provider/profile_api.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class ProfileController extends GetxController {
  var image = '';
  var selectedImagePath = ''.obs;
  TextEditingController enterNewPassword = TextEditingController();

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
      //         .toStringAsFixed(2) +
      //         'Mb';
    } else {
      MySnackbar.infoSnackBar(
          'No Image selected', 'Please select a image for your profile');
    }
  }

  changePasswordFunc() async {
    var userId = GetStorage();

    //LoadingComponent.alertDialog('Logging, please wait', '');
    //print('full address.... : ${getLocation()}');

    var response = await ProfileApi.changePasswordApi(
        userId.read('userId'), enterNewPassword.text.trim());

    print('panic api response: ${response.message}');

    if (response.message == 'Successfully changed') {
      Get.back();
      Get.back();
      MySnackbar.successSnackBar(
          'Password changed', 'password change successfully');
    } else {
      Get.back();
      MySnackbar.errorSnackBar(
          'Server down', 'server down please try again later!');

    }
  }
}
