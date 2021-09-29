import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/address_list.dart';
import 'package:shree_pharmacy/app/modules/address/address_api.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_alert_dilog.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class AddressController extends GetxController {
  var box = GetStorage();
  var isLoading = true.obs;
  var addressList = List<Address>().obs;

  //Add address

  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  fetchAddressList() async {
    try {
      isLoading(true);
      var addresses = await AddressApi.fetchAddressList(box.read('userId'));
      print('addressList $addresses');
      if (addresses != null) {
        addressList.assignAll(addresses.address);
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  // String address,
  //       String user_id,
  //       String state,
  //       String city,
  //       String country,
  //       String zip

  addAddress() async {
    MyAlertDialog.circularProgressDialog();
    //Order created
    var response = await AddressApi.addAddress(
        address.text.trim().toString(),
        box.read('userId').toString(),
        state.text.trim().toString(),
        city.text.trim().toString(),
        country.text.trim().toString(),
        pincode.text.trim().toString());
    if (response.message == 'Successfully added') {
      addressList.refresh();
      Get.back();
      MySnackbar.successSnackBar(
          'Added Successful', 'Address added successfully');
    } else {
      Get.back();
      MySnackbar.infoSnackBar(
          'Server Down', 'Server down, please try again later');
    }
  }
}
