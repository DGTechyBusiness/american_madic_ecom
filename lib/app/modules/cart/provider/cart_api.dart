import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/cartList_model.dart';
import 'package:shree_pharmacy/app/models/response_model.dart';

class CartApi {
  static var client = http.Client();

  static Future<CartListModel> addToCart(
      String productId, String userId, String price, String qty) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //user_id:7
    // product_id:gid://shopify/Product/6030212432026
    // price:100
    // qty:1
    var response = await client.post('${baseUrl}addTocart', body: {
      'user_id': userId,
      'product_id': productId,
      'price': price,
      'qty': qty
    });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cartListModelFromJson(jsonString);
    } else
      return cartListModelFromJson(response.body);
  }

  static Future<CartListModel> deleteCart(
      String userId, String productId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //user_id:7
    // product_id:gid://shopify/Product/6030212432026
    // price:100
    // qty:1
    var response = await client.post('${baseUrl}cartDelete',
        body: {'user_id': userId, 'cart_id': productId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cartListModelFromJson(jsonString);
    } else
      return cartListModelFromJson(response.body);
  }

  static Future<ResponseModel> removeFromWishList(
      String productId, String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}removeWishlist',
        body: {'user_id': userId, 'product_id': productId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return responseModelFromJson(jsonString);
    } else
      return responseModelFromJson(response.body);
  }

  static Future<CartListModel> fetchCartList(String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response =
        await client.post('${baseUrl}cartList', body: {'user_id': userId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cartListModelFromJson(jsonString);
    }
  }
}
