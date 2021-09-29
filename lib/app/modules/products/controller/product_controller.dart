import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/product_list_model.dart';
import 'package:shree_pharmacy/app/models/recentview_models.dart';
import 'package:shree_pharmacy/app/modules/products/provider/product_api.dart';

class ProductController extends GetxController {
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
  var productList = List<ProductsEdge>();
  var similarProductList = List<ProductsEdge>();
  var data = Data();

  Future<Data> fetchProducts(String id, String cursor, String type) async {
    try {
      isLoading(true);
      data = await ProductApi.fetchProducts(id, cursor, type);
      print('productList: $data');

      if (data.collection.products.edges != null) {
        productList.assignAll(data.collection.products.edges);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchSimilarProducts(String id, String cursor, String type) async {
    try {
      isLoading(true);
      var similarProduct =
          await ProductApi.fetchSimilarProducts(id, cursor, type);
      print('similarProducts: $similarProduct');

      if (similarProduct != null) {
        similarProductList.assignAll(data.collection.products.edges);
      }
    } finally {
      isLoading(false);
    }
  }

}
