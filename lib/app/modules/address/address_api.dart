import 'package:global_configuration/global_configuration.dart';
import 'package:shree_pharmacy/app/models/address_list.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/response_model.dart';

class AddressApi {
  static var client = http.Client();

  static Future<AddressListModel> fetchAddressList(String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response =
        await client.post('${baseUrl}addresslist', body: {'user_id': userId});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return addressListModelFromJson(jsonString);
    }
  }

  static Future<ResponseModel> addAddress(
      //address:address
      // user_id:7
      // state:Statew
      // city:durgapur
      // country:India
      // zip:7894561
      String address,
      String user_id,
      String state,
      String city,
      String country,
      String zip) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    //Order created
    //user_id,address, billingAddress,type=cart, paymentId
    print(
        'userid :$user_id, address: $address, state: $state, city: $city, country: $country, zip: $zip');

    //user_id,address, billingAddress,type=cart, paymentId
    var response = await client.post('${baseUrl}addressAdd', body: {
      'address': address,
      'user_id': user_id,
      'state': state,
      'city': city,
      'country': country,
      'zip': zip
    });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return responseModelFromJson(jsonString);
    } else
      return responseModelFromJson(response.body);
  }
}
