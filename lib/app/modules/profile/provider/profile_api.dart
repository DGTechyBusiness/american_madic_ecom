import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/change_password_model.dart';

class ProfileApi{

  static var client = http.Client();

  static Future<ChangePasswordModel> changePasswordApi(String userId, String password ) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    print(
        'Panic values in api class: userId:$userId, password:$password');

    var response = await client.post('${baseUrl}ChangePassword', body: {
      'user_id': userId,
      'new_password': password,
    });

    print('login response : ${response.statusCode}');

    if (response.statusCode == 200) {
      return changePasswordModelFromJson(response.body);
    }
  }
}