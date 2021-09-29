import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/response_model.dart';

class RegisterApi {
  static var client = http.Client();

  static Future<ResponseModel> regisetrFunc(String name, String mobile, String email,
      String dob, String password) async {
    var baseurl = GlobalConfiguration().get('base_url');

    print('user reg data: name: $name, mobile: $mobile, email: $email, dob: $dob, password: $password');

    //Name, mobile, email, dob, password
    var response = await client.post('${baseurl}userAdd', body: {
      'name': name,
      'mobile': mobile,
      'email': email,
      'dob': dob,
      'password': password
    });

    print('base url: $baseurl, response: $response');

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return responseModelFromJson(jsonString);
    }
  }
}
