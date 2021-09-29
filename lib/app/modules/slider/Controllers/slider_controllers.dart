import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/slider_model.dart';
import 'package:shree_pharmacy/app/modules/slider/providers/slider_api.dart';

class SliderController extends GetxController {
  var isLoading = true.obs;
  var sliderList = List<DatumSlider>().obs;


  @override
  void onInit() async{
   await fetchSlider();
    super.onInit();
  }

  fetchSlider() async {
    try {
      isLoading(true);
      var sliders = await SliderApi.fetchSliders();
      print('sliders $sliders');

      if (sliders != null) {
        sliderList.assignAll(sliders);
      }
    } finally {
      isLoading(false);
    }
  }
}
