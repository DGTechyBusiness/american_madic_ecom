import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/login_model.dart';

class LoginApi {
  static var client = http.Client();

  static Future<LoginModel> loginFunc(
      String email, String password, String fcm, String deviceId) async {
    var baseurl = GlobalConfiguration().get('base_url');

    print('user reg data: email: $email, password: $password');

    //email, password, fcm, deviceid
    var response = await client.post('${baseurl}UserLogin', body: {
      'email': email,
      'password': password,
      'fcm': fcm,
      'deviceid': deviceId
    });

    print('base url: $baseurl, response: ${response.body}');

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return loginModelFromJson(jsonString);
    }
  }
}
