import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/slider_model.dart';
import 'package:shree_pharmacy/app/modules/category/view/categoryView.dart';
import 'package:shree_pharmacy/app/modules/category/view/mens_view.dart';
import 'package:shree_pharmacy/app/modules/category/view/senior_view.dart';
import 'package:shree_pharmacy/app/modules/category/view/womens_view.dart';
import 'package:shree_pharmacy/app/modules/home/controllers/category_controller.dart';
import 'package:shree_pharmacy/app/modules/products/controller/product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/controller/recent_product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_details_view.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_view.dart';
import 'package:shree_pharmacy/app/modules/slider/Controllers/slider_controllers.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  SliderController sliderController = Get.put(SliderController());
  RecentProductController recentProductController =
      Get.put(RecentProductController());
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LimitedBox(
      child: ListView(
        children: [
          SizedBox(height: 10),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 20, top: 10, bottom: 8),
          //         child: Text('Search for products',
          //             textAlign: TextAlign.left,
          //             style: TextStyle(fontSize: 12, color: Colors.black87)),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(right: 20),
          //         child: Icon(Icons.search, color: Colors.black87),
          //       )
          //     ],
          //   ),
          //   margin: EdgeInsets.only(left: 50, right: 50, top: 8),
          //   height: 34,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[300],
          //     borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(40.0),
          //         bottomRight: Radius.circular(40.0),
          //         topLeft: Radius.circular(40.0),
          //         bottomLeft: Radius.circular(40.0)),
          //   ),
          // ),
          //Slider (need to fix)

          SizedBox(height: 30),

          getTextCategories(),

          Container(
              color: Colors.white,
              height: 200.0,
              width: double.infinity,
              child:
                  // Obx((){
                  //  return

                  Carousel(
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.black54,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.white,
                showIndicator: true,
                dotIncreasedColor: Colors.black54,
                // images: getImages()
                images: [
                  Image.asset('assets/images/bannerone.jpeg'),
                  Image.asset('assets/images/bannertwo.jpeg')
                ],

                // images: [
                //   // ignore: unrelated_type_equality_checks
                //   for (var i = 5; i == sliderController.sliderList; i++)
                //     {
                //       print('sliders are: ${sliderController.sliderList[i].sliderImage}'),
                //       NetworkImage(
                //         sliderController.sliderList[i].sliderImage,
                //       ),
                //     }
                // ],
              )
              // })
              ),

          SizedBox(height: 10),

          //Banner one
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
                elevation: 0,
                child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/images/bannerone.jpeg'))),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Top categories',
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CategoryView());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 18),
                  child: Text(
                    'view all',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),

          GetX<CategoryController>(
            initState: (context) {},
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 8.0 / 12.0,
                  children: new List<Widget>.generate(
                      controller.categoryList.length > 6
                          ? 6
                          : controller.categoryList.length, (index) {
                    if (controller.categoryList[index].node.title ==
                            'Home page' ||
                        controller.categoryList[index].node.title ==
                            'All Products') {
                      categoryController.categoryList.removeAt(index);
                      categoryController.categoryList.removeAt(index);
                    }

                    return InkWell(
                      onTap: () {
                        print(
                            'categoryId.... : ${controller.categoryList[index].node.id}');
                        Get.to(() => ProductView(
                            controller.categoryList[index].node.id,
                            controller.categoryList[index].node.title));
                      },
                      child:
                          // controller.categoryList[index].node.title == 'Home page' ||
                          // controller.categoryList[index].node.title == 'All Products'?
                          //null:
                          GridTile(
                        child: Card(
                            elevation: 0,
                            margin: EdgeInsets.all(2),
                            child: new Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.0),
                                  Expanded(
                                    child: controller.categoryList[index].node
                                                .image !=
                                            null
                                        ? FadeInImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(controller
                                                .categoryList[index]
                                                .node
                                                .image
                                                .originalSrc),
                                            placeholder: AssetImage(
                                                'assets/images/loading.gif'))
                                        : Image.asset('assets/images/logo.png'),
                                  ),

                                  // Image.network(controller
                                  //     .categoryList[index].image)),

                                  SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 6, right: 8),
                                    child: Text(
                                      controller.categoryList[index].node.title,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  }),
                );
              }
            },
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent viewed',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          getRecentProducts(),
        ],
      ),
    ));
  }

  List<Widget> getImages() {
    return List<Widget>.generate(
        sliderController.sliderList.length,
        (index) =>
            Image.network(sliderController.sliderList[index].sliderImage));
  }

  getImgeloop() {
    List<DatumSlider> sliderList = sliderController.sliderList;
    List<String> sliderLoaderStr = List();

    for (var i in sliderList) {
      sliderLoaderStr.add(i.sliderImage);
    }
    return sliderLoaderStr;
  }

  getSimilarProducts() => GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 8.0 / 12.0,
        //productList[index].node.variants.edges[0]
        //controller.productList.length
        children: new List<Widget>.generate(4, (index) {
          return GestureDetector(
            onTap: () {
              //ProductDetailsView(this.productId, this.price, this.stock, {this.categoryId});
              // Get.to(ProductDetailsView(
              //     controller.productList[index].node
              //         .variants.edges[0].node.product.id,
              //     controller.productList[index].node.variants.edges[0].node.price.toString(),
              //     controller.productList[index].node.variants.edges[0].node.inventoryQuantity.toString(),
              //     categoryId: categoryId));
            },
            child: new GridTile(
              child: new Card(
                  elevation: 1,
                  shadowColor: AppColors.themeColor,
                  margin: EdgeInsets.all(4),
                  child: new Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.0),
                        Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: FadeInImage(
                              fit: BoxFit.fitHeight,
                              //https://cdn.shopify.com/s/files/1/0521/4027/7914/products/PRE-C90_Supreme.png?v=1611780492
                              image: NetworkImage(
                                  'https://cdn.shopify.com/s/files/1/0521/4027/7914/products/PenaMax2_1024x1024@2x.png?v=1611930495'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif')),
                        )),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 6, right: 8),
                          child: Text(
                            'Demo Product',
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 2, bottom: 2, left: 6, right: 8),
                        //   child: Text(
                        //     'Mfg: ${controller.productList[index].mfgName}',
                        //     textAlign: TextAlign.center,
                        //     maxLines: 2,
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 11),
                        //   ),
                        // ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 4, left: 6, right: 1),
                              child: Text(
                                '\$ 120 ',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 6,
                        //       bottom: 8,
                        //       left: 6,
                        //       right: 8),
                        //   child: controller
                        //       .productList[index]
                        //       .node
                        //       .variants
                        //       .edges[0]
                        //       .node
                        //       .inventoryQuantity ==
                        //       0
                        //       ? Text(
                        //     '  Out of Stock',
                        //     textAlign:
                        //     TextAlign.center,
                        //     maxLines: 2,
                        //     style: TextStyle(
                        //         color: Colors.red,
                        //         fontWeight:
                        //         FontWeight.w400,
                        //         fontSize: 12),
                        //   )
                        //       : Text(
                        //     '  In Stock ${controller.productList[index].node.variants.edges[0].node.inventoryQuantity}',
                        //     textAlign:
                        //     TextAlign.center,
                        //     maxLines: 2,
                        //     style: TextStyle(
                        //         color: Colors.green,
                        //         fontWeight:
                        //         FontWeight.w400,
                        //         fontSize: 12),
                        //   ),
                        // ),
                        SizedBox(height: 8),
                      ],
                    ),
                  )),
            ),
          );
        }),
      );

  getRecentProducts() => GetX<RecentProductController>(
        initState: (context) {
          //recentProductController.fetchRecentProducts(box.read('userid'));
          recentProductController.fetchRecentProducts(box.read('userId').toString());
        },
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return
                //Text('data');

                GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 8.0 / 12.0,
              //productList[index].node.variants.edges[0]
              //controller.productList.length
              children: new List<Widget>.generate(
                  controller.recentProductsList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    //String productId, price, stock, image, name, categoryId;
                    Get.to(ProductDetailsView(
                        controller.recentProductsList[index].productId,
                        controller.recentProductsList[index].price,
                        controller.recentProductsList[index].stock,
                        controller.recentProductsList[index].image,
                        controller.recentProductsList[index].name));
                  },
                  child: new GridTile(
                    child: new Card(
                        elevation: 1,
                        shadowColor: AppColors.themeColor,
                        margin: EdgeInsets.all(4),
                        child: new Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.0),
                              Expanded(
                                  child: Align(
                                alignment: Alignment.center,
                                child: FadeInImage(
                                    fit: BoxFit.fitHeight,
                                    //https://cdn.shopify.com/s/files/1/0521/4027/7914/products/PRE-C90_Supreme.png?v=1611780492
                                    image: NetworkImage(controller
                                        .recentProductsList[index].image),
                                    placeholder: AssetImage(
                                        'assets/images/loading.gif')),
                              )),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, left: 6, right: 8),
                                child: Text(
                                  controller.recentProductsList[index].name,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        )),
                  ),
                );
              }),
            );
          }
        },
      );

  getTextCategories() => GetX<CategoryController>(
        initState: (context) {},
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 5,
              childAspectRatio: 1.0 / .6,
              children: new List<Widget>.generate(
                  controller.categoryList.length > 5
                      ? 5
                      : controller.categoryList.length, (index) {
                if (controller.categoryList[index].node.title == 'Home page' ||
                    controller.categoryList[index].node.title ==
                        'All Products') {
                  categoryController.categoryList.removeAt(index);
                  categoryController.categoryList.removeAt(index);
                }

                return InkWell(
                    onTap: () {
                      print(
                          'categoryId.... : ${controller.categoryList[index].node.id}');
                      Get.to(() => ProductView(
                          controller.categoryList[index].node.id,
                          controller.categoryList[index].node.title));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 6, right: 8),
                      child: Text(
                        controller.categoryList[index].node.title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ));
              }),
            );
          }
        },
      );
}
