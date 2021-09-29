import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/product_list_model.dart';
import 'package:shree_pharmacy/app/models/recentview_models.dart';

class ProductApi {
  static var client = http.Client();

  // static Future<List<DatumProducts>> fetchProducts(String categoryId) async {
  //   var baseUrl = GlobalConfiguration().get('base_url');
  //
  //   // box.write('schoolId', schoolId);
  //   //        box.write('teacherId', teacherId);
  //
  //   var response = await client.post('${baseUrl}product/list', body: {'cat_id':categoryId});
  //
  //   print('response similarProducts: ' + baseUrl);
  //
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return productModelFromJson(jsonString).data;
  //   }
  // }

  static Future<Data> fetchProducts(
      String id, String cursor, String type) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);
//productList

    var response = await client.post('${baseUrl}productList',
        body: {'id': id, 'cursor': cursor, 'type': type});

    print('response productlist: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      //return productListModelFromJson(jsonString).data.collection.products.edges;
      return productListModelFromJson(jsonString).data;
    }
  }

  static Future<Data> fetchSimilarProducts(
      String id, String cursor, String type) async {
    var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.post('${baseUrl}productList',
        body: {'id': id, 'cursor': cursor, 'type': type});

    print('response similarProducts: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      //return productListModelFromJson(jsonString).data.collection.products.edges;
      return productListModelFromJson(jsonString).data;
    }
  }

}
