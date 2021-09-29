import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/recentview_models.dart';
import 'package:shree_pharmacy/app/modules/products/provider/recent_product_api.dart';

class RecentProductController extends GetxController {
  // var isLoading = true.obs;
  // var productList = List<DatumProducts>();
  //
  //
  // void fetchProducts(String categoryId) async {
  //   try {
  //     isLoading(true);
  //     var products = await ProductApi.fetchProducts(categoryId);
  //     print('categories $products');
  //
  //     if (products != null) {
  //       productList.assignAll(products);
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    //fetchProducts();
    super.onInit();
  }

  var isLoading = true.obs;
  var recentProductsList = List<RecentDatum>();


  void fetchRecentProducts(String userId) async {
    try {
      isLoading(true);
      var recentProduct = await RecentProdcutApi.fetchRecentProducts(userId);
      print('recentproducts: $recentProduct');

      if (recentProduct != null) {
        recentProductsList.assignAll(recentProduct.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
