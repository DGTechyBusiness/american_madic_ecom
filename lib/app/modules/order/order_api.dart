import 'package:global_configuration/global_configuration.dart';
import 'package:shree_pharmacy/app/models/order_model.dart';
import 'package:shree_pharmacy/app/models/response_model.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  static var client = http.Client();

  static Future<ResponseModel> createOrder(
      String user_id,
      String address,
      String billingAddress,
      String type,
      String paymentId,
      String productId,
      String quantity,
      String price) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //Order created
    //[user_id,address, billingAddress,type=single, paymentId, productId,quantity price]
    var response = await client.post('${baseUrl}orderCreate', body: {
      'user_id': user_id,
      'address': address,
      'billingAddress': address,
      'type': type,
      'paymentId': paymentId,
      'productId': productId,
      'quantity': quantity,
      'price': price
    });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return responseModelFromJson(jsonString);
    } else
      return responseModelFromJson(response.body);
  }

  //Cart order created
  static Future<ResponseModel> createOrderFromCart(
      String user_id,
      String address,
      String billingAddress,
      String type,
      String paymentId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //Order created
    //user_id,address, billingAddress,type=cart, paymentId
    print(
        'userid :$user_id, address: $address, billing: $billingAddress, type: $type, paymentid: $paymentId');

    //user_id,address, billingAddress,type=cart, paymentId
    var response = await client.post('${baseUrl}orderCreate', body: {
      'user_id': user_id,
      'address': address,
      'billingAddress': address,
      'type': type,
      'paymentId': paymentId
    });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return responseModelFromJson(jsonString);
    } else
      return responseModelFromJson(response.body);
  }

  static Future<OrderModel> fetchOrderList(String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response =
    await client.post('${baseUrl}orderList', body: {'user_id': userId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return orderModelFromJson(jsonString);
    }
  }
}
