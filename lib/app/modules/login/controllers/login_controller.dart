import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/home/views/pages_view.dart';
import 'package:shree_pharmacy/app/modules/login/providers/login_api.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/loading_components.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var name = 'Login'.obs;

  final box = GetStorage();

  // @override
  // void onInit() {
  //   name.value = box.read('name');
  // }

  getLogin() async {
    LoadingComponent.alertDialog('Loading, please wait', '');

    var response = await LoginApi.loginFunc(emailController.text.trim(),
        passwordController.text.trim(), 'fcm', 'did');

    //print('register controller response: ${response.message}');
    if (response != null) {
      if (response.status == 1 && response.message == 'Successfully login') {
        //"user_id": "7",
        //         "defaultAddress": "1",
        //         "name": "Sam",
        //         "email": "sam@gmail.com",
        //         "phone": "9876543210",
        //         "password": "7c4a8d09ca3762af61e59520943dc26494f8941b",
        //         "address": null,
        //         "city": null,
        //         "state": null,
        //         "country": null,
        //         "zip": null,
        //         "status": "1",
        //         "creation_date": "2021-07-27 02:12:46",
        //         "image": "",
        //         "device_id": "",
        //         "fcm_token": "",
        //         "dob": "0001-02-20",
        //         "reg_date": "2021-07-27",
        //         "uuid": "60ffa3de659b0",
        //         "profile_image": "https://igmiweb.
        String userId = response.user.userId;
        String mobile = response.user.phone;
        String nameStr = response.user.name;
        String email = response.user.email;
        String bDay = response.user.dob.toString();
        String profile_image = response.user.profileImage;

        String address = response.user.address;
        String city = response.user.city;
        String state = response.user.state;
        String country = response.user.country;
        String zip = response.user.zip;

        print('userid: $userId, mobile: $mobile, name: $name, email: $email');

        box.write('login', 'true');

        box.write('loginStatus', 'true');
        box.write('userId', userId);
        box.write('mobile', mobile);
        box.write('name', nameStr);
        box.write('email', email);
        box.write('bDay', bDay);

        box.write('profileImage', profile_image);
        box.write('address', address);
        box.write('city', city);
        box.write('state', state);
        box.write('country', country);
        box.write('zip', zip);

        name.value = box.read('name').toString();

        Get.back();
        Get.back();
        MySnackbar.successSnackBar('Success', 'Login successfully done');
        // Get.off(PagesView());
      } else if (response.message == 'Invalid login') {
        Get.back();
        MySnackbar.infoSnackBar(
            'Invalid credentials', 'Invalid email or password');
      } else {
        Get.back();
        MySnackbar.errorSnackBar(
            'Login failed', 'Server down, please try again later');
      }
    }
  }
}
