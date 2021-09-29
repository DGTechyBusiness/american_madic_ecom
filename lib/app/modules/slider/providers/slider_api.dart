import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/slider_model.dart';


class SliderApi {
  static var client = http.Client();

  // ignore: missing_return
  static Future<List<DatumSlider>> fetchSliders() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    // box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}slider/list');

    print('response categories: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return sliderModelFromJson(jsonString).data;
    }
  }
}
