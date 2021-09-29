import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';
import 'package:shree_pharmacy/app/models/product_details.dart';

class ProductDetailsApi {
  static var client = http.Client();

  static Future<ProductDetailsData> fetchProductDetails(
      String productId, String userId, String image, String name, String price, String stock) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);
//productList

    // var response = await client.post('${baseurl}UserLogin', body: {
    //       'email': email,
    //       'password': password,
    //       'fcm': fcm,
    //       'deviceid': deviceId
    //     });

    var response = await client.post('${baseUrl}productDetails', body: {
      'id': productId,
      'user_id': userId,
      'image': image,
      'name': name,
      'price':price,
      'stock':stock
    });

    print('in product detaisls, userid: $userId, productId: $productId');
    print('response similarProducts: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      //return productListModelFromJson(jsonString).data.collection.products.edges;
      return productDetailsModelFromJson(jsonString).data;
    } else
      return productDetailsModelFromJson(response.body).data;
  }
}
