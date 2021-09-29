import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/product_details.dart';
import 'package:shree_pharmacy/app/modules/products/provider/product_details_api.dart';

class ProductDetailsController extends GetxController {
  List<bool> selections = List.generate(1, (_) => false).obs;
  var selectedQuantity = '1'.obs;
  var isLoading = true.obs;
  var productDetailsData = ProductDetailsData();
  var box = GetStorage();

  List<String> getQuantity() {
    List<String> quantityList = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ];
    return quantityList;
  }

  Future<ProductDetailsData> fetchProductDetails(String productId, String userId, String image, String name, String price, String stock) async {
    try {
      isLoading(true);
      productDetailsData = await ProductDetailsApi.fetchProductDetails(productId, userId, image, name, price, stock);
      print('productList.... $productDetailsData');

      // if (productDetailsData.collection.products.edges != null) {
      //   productDetailsData.assignAll(data.collection.products.edges);
      // }
    } finally {
      isLoading(false);
    }
  }
}
