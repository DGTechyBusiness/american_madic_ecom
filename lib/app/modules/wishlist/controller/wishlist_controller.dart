import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/wishlist_model.dart';
import 'package:shree_pharmacy/app/modules/wishlist/provider/wishlist_api.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_alert_dilog.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class WishListController extends GetxController {
  var box = GetStorage();
  var isLoading = true.obs;
  var wishListProducts = List<ListElement>();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchWishlistProducts();
    super.onInit();
  }

  addToWishList(String productId) async {
    MyAlertDialog.circularProgressDialog();
    var response =
        await WishListApi.addToWishList(productId, box.read('userId'));

    if (response != null) {
      if (response.message == 'Product wishlisted') {
        Get.back();
        MySnackbar.successSnackBar(
            'Successfully added', 'Product added to wishList');
      } else if (response.message == 'Product already in cart') {
        Get.back();
        MySnackbar.infoSnackBar(
            'Already in wishlist', 'Product already in wishlist');
      } else {
        Get.back();
        MySnackbar.errorSnackBar('Server down!', 'Please try again later');
      }
    }
  }

  removeFromWishList(String productId) async {
    MyAlertDialog.circularProgressDialog();
    var response =
        await WishListApi.removeFromWishList(productId, box.read('userId'));

    if (response != null) {
      if (response.message == 'Product remove from wishlist') {
        Get.back();
        MySnackbar.successSnackBar(
            'Successfully Removed', 'Product removed from wishList');
      } else {
        Get.back();
        MySnackbar.errorSnackBar('Server down!', 'Please try again later');
      }
    }
  }

  void fetchWishlistProducts() async {
    try {
      isLoading(true);
      var products = await WishListApi.fetchWishList(box.read('userId'));
      print('productsList $products');

      if (products != null) {
        wishListProducts.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
