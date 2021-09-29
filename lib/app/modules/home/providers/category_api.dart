import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/category_model.dart';

class CategoryApi {
  static var client = http.Client();

  static Future<List<Edge>> fetchCategories() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.get('${baseUrl}category');

    print('response categories: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryListModelFromJson(jsonString).data.collections.edges;
    }
  }
}
