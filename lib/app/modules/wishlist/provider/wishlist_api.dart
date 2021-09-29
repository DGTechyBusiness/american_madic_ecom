import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/response_model.dart';
import 'package:shree_pharmacy/app/models/wishlist_model.dart';

class WishListApi {
  static var client = http.Client();

  static Future<ResponseModel> addToWishList(
      String productId, String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}addWishlist',
        body: {'user_id': userId, 'product_id': productId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return responseModelFromJson(jsonString);
    } else
      return responseModelFromJson(response.body);
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

  static Future<List<ListElement>> fetchWishList(String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}wishlist', body: {'user_id': userId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return wishListProductModelFromJson(jsonString).list;
    }
  }
}
