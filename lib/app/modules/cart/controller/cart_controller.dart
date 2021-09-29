import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/cartList_model.dart';
import 'package:shree_pharmacy/app/modules/cart/provider/cart_api.dart';
import 'package:shree_pharmacy/app/modules/cart/views/cart_views.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_alert_dilog.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class CartController extends GetxController {
  var selectedQnty = 1.obs;
  var box = GetStorage();
  var isLoading = true.obs;
  var cartListProductsList = List<ListElement>().obs;
  var cartListProducts = CartListModel().obs;

  incremnetQnty(int index) {
    int cartQnt;
    if (selectedQnty < 10) {
      // selectedQnty++;
      //int cartQnt;
     // selectedQnty.value = int.parse(cartListProducts[index].quantity);
    }
    return cartQnt;
  }

  decreamentQnty() {
    if (selectedQnty > 1) {
      selectedQnty--;
    }
  }

  addToCart(String productId, String price) async {
    MyAlertDialog.circularProgressDialog();
    var response = await CartApi.addToCart(
        productId, box.read('userId'), price, selectedQnty.value.toString());

    if (response != null) {
      if (response.message == 'Successfully added to cart') {
        Get.back();
        Get.to(CartView());
        MySnackbar.successSnackBar(
            'Successfully added', 'Product added to cart');
      } else if (response.message == 'Product already in cart') {
        Get.back();
        MySnackbar.infoSnackBar('Already in cart', 'Product already in cart');
      } else {
        Get.back();
        MySnackbar.errorSnackBar('Server down!', 'Please try again later');
      }
    }
  }

  // fetchCartListProducts() async {
  //   try {
  //     isLoading(true);
  //     var products = await CartApi.fetchCartList(box.read('userId'));
  //     print('cartlistProduct $products');
  //     if (products != null) {
  //       cartListProducts.assignAll(products.list);
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }


  fetchCartListProducts() async {
    try {
      isLoading(true);
      var products = await CartApi.fetchCartList(box.read('userId'));
      print('cartlistProduct $products');
      if (products != null) {
        cartListProducts.value = products;
        cartListProductsList.assignAll(products.list);
      }
    } finally {
      isLoading(false);
    }
  }


  deleteCart(String cartProductId) async {
    //MyAlertDialog.circularProgressDialog();
    var response = await CartApi.deleteCart(
      box.read('userId'),
      cartProductId,
    );

    print('response in cart delete: ${response.message}');
    if (response != null) {
      if (response.message == 'Cart list deleted') {
        // Get.back();
        // //Get.to(CartView());
        // MySnackbar.successSnackBar(
        //     'Successfully deleted', 'Product deleted from cart');
        print('cart item deleted');
      } else {
        // Get.back();
        // MySnackbar.errorSnackBar('Server down!', 'Please try again later');
      }
    }
  }
}

