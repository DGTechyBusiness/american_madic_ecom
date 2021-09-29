import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/recentview_models.dart';

class RecentProdcutApi{
  static var client = http.Client();


  static Future<RecentViewModel> fetchRecentProducts(
      String userId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post('${baseUrl}recentViews',
        body: {'user_id': userId});

    print('response recentProduct: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      //return productListModelFromJson(jsonString).data.collection.products.edges;
      return recentViewModelFromJson(jsonString);
    }
  }
}