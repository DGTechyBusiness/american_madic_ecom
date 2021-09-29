import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/order_model.dart';
import 'package:shree_pharmacy/app/modules/order/order_api.dart';
import 'package:shree_pharmacy/app/modules/order/views/order_success.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_alert_dilog.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class OrderController extends GetxController {
  var box = GetStorage();
  var isLoading = true.obs;
  var orderList = List<DatumOrder>().obs;

  createOrder(address, billingAddress, type, paymentId, productId, quantity, price) async {
    MyAlertDialog.circularProgressDialog();
    //Order created
    var response = await OrderApi.createOrder(box.read('userId'), address,
        billingAddress, type, paymentId, productId, quantity, price);

    if (response.message == 'Order created') {
      Get.back();
      Get.to(OrderSuccess());
      MySnackbar.successSnackBar(
          'Order Successful', 'Order created successfully');
    } else {
      Get.back();
      MySnackbar.infoSnackBar(
          'Server Down', 'Server down, please try again later');
    }
  }

  createOrderCart(address, billingAddress, type, paymentId) async {
    MyAlertDialog.circularProgressDialog();
    //Order created
    var response = await OrderApi.createOrderFromCart(box.read('userId'), address, billingAddress, type, paymentId);

    if (response.message == 'Order created') {
      Get.back();
      Get.to(OrderSuccess());
      MySnackbar.successSnackBar(
          'Order Successful', 'Order created successfully');
    } else {
      Get.back();
      MySnackbar.infoSnackBar(
          'Server Down', 'Server down, please try again later');
    }
  }

  fetchOrderListProducts() async {
    try {
      isLoading(true);
      var orders = await OrderApi.fetchOrderList(box.read('userId'));
      print('orderList $orders');
      if (orders != null) {
        orderList.assignAll(orders.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
