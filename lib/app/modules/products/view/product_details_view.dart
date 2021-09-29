import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/models/product_details.dart';
import 'package:shree_pharmacy/app/modules/address/view/address_view.dart';
import 'package:shree_pharmacy/app/modules/cart/controller/cart_controller.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/modules/products/controller/product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/controller/productdetails_controller.dart';
import 'package:shree_pharmacy/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class ProductDetailsView extends StatefulWidget {
  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
  String productId, price, stock, image, name, categoryId;

  ProductDetailsView(
      this.productId, this.price, this.stock, this.image, this.name,
      {this.categoryId});
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  ProductController productController = Get.put(ProductController());
  WishListController wishListController = Get.put(WishListController());
  CartController cartController = Get.put(CartController());
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      appBar: AppBar(title: Text('Product Details')),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetX<ProductDetailsController>(
          initState: (context) {
            productDetailsController.fetchProductDetails(widget.productId,
                box.read('userId'), widget.image, widget.name, widget.price, widget.stock);
          },
          builder: (controller) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                    child: MyWidgets.textView(
                        controller.productDetailsData.product.title,
                        Colors.black,
                        22,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: MyWidgets.textView(
                        'Seller - ${controller.productDetailsData.product.vendor}',
                        Colors.black,
                        16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 4),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 30,
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.black, size: 18),
                            MyWidgets.textView(
                                ' BEST PRICE  ', Colors.black, 12)
                          ],
                        ),
                      ),
                      ToggleButtons(
                        children: [Icon(Icons.favorite)],
                        renderBorder: false,
                        disabledColor: Colors.white,
                        selectedColor: Colors.red,
                        onPressed: (int index) {
                          setState(() {
                            print('isSelectedwishlist*********************** ${productDetailsController.selections[index]}');
                            if (productDetailsController.selections[index] ==
                                false) {
                              wishListController.addToWishList(
                                  controller.productDetailsData.product.id);
                            } else {
                              wishListController.removeFromWishList(
                                  controller.productDetailsData.product.id);
                            }

                            productDetailsController.selections[index] =
                                !productDetailsController.selections[index];
                          });
                        },
                        isSelected: productDetailsController.selections,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.share, color: Colors.blue)),
                  ),
                  Center(
                      child: Container(
                    height: 240,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: getSliderList(
                          controller.productDetailsData.product.images.edges),
                    ),

                  )),
                  SizedBox(height: 10),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      MyWidgets.textView(
                          "\$ ${controller.productDetailsData.product.variants.edges[0].node.price} ",
                          Colors.black,
                          30,
                          fontWeight: FontWeight.w900),
                    ],
                  ),
                  SizedBox(height: 6),
                  MyWidgets.textView('Including all texes', Colors.black54, 12),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    color: Colors.black12,
                    height: 4,
                    width: double.infinity,
                  ),

                  //Product Details
                  MyWidgets.textView('Product Details', Colors.black, 16,
                      fontWeight: FontWeight.w700),
                  ExpandableText(
                    controller.productDetailsData.product.description,
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 4,
                    linkColor: Colors.blue,
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    color: Colors.black12,
                    height: 4,
                    width: double.infinity,
                  ),
                  SizedBox(height: 30),
                  //Similar products
                  MyWidgets.textView('Similar Product', Colors.black, 19,
                      fontWeight: FontWeight.w600),
                  SizedBox(height: 22),

                  getSimilarProducts(),
                  SizedBox(height: 30)
                ],
              );
            }
          },
        ),
      ))),
    );
  }

  Widget bottomBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.redColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            margin: EdgeInsets.only(left: 15),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_up),
                  underline: SizedBox(),
                  items: productDetailsController
                      .getQuantity()
                      .map((String stringItemValue) {
                    return DropdownMenuItem<String>(
                      value: stringItemValue,
                      child: Text(stringItemValue),
                    );
                  }).toList(),
                  onChanged: (String selectedItem) {
                    setState(() {
                      productDetailsController.selectedQuantity.value =
                          selectedItem;
                    });
                  },
                  value: productDetailsController.selectedQuantity.value),
            ),
          ),
          FlatButton(
            onPressed: () {
              cartController.addToCart(widget.productId, widget.price);
            },
            child: Text('ADD TO CART', style: TextStyle(color: Colors.black)),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RaisedButton(
                color: AppColors.redColor,
                child: MyWidgets.textView('BUY NOW', Colors.white, 14),
                onPressed: () {
                  // double totalAmount = double.parse(widget.price) *
                  //     int.parse(
                  //         productDetailsController.selectedQuantity.value);
                  double totalAmount = double.parse(widget.price) *
                      int.parse(
                          productDetailsController.selectedQuantity.value);
                  Get.to(AddressView(totalAmount.toStringAsFixed(2), 'pd',
                      productId: widget.productId,
                      quantity:
                          productDetailsController.selectedQuantity.value));
                }),
          ),
        ],
      ),
    );
  }

  getSliderList(List<ImagesEdge> imgEdges) {
    List<String> imgList = List();

    for (int i = 0; i < imgEdges.length; i++) {
      imgList.add(imgEdges[i].node.originalSrc);
    }
    print('imageList in slider...$imgList');

    return imgList
        .map((item) => FadeInImage(
            fit: BoxFit.fill,
            image: NetworkImage(item),
            placeholder: AssetImage('assets/images/loading.gif')))
        .toList();
  }

  getSimilarProducts() {
    return GetX<ProductController>(
      initState: (context) {
        productController.fetchSimilarProducts(widget.categoryId, '', '');
      },
      builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 8.0 / 12.0,
            //productList[index].node.variants.edges[0]
            //controller.productList.length
            children: new List<Widget>.generate(
                controller.productList.length > 4
                    ? 4
                    : controller.productList.length, (index) {
              return GestureDetector(
                onTap: () {
                  print('Smilar product tapped!');
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
                                      .productList[index]
                                      .node
                                      .variants
                                      .edges[0]
                                      .node
                                      .product
                                      .featuredImage
                                      .originalSrc),
                                  placeholder:
                                      AssetImage('assets/images/loading.gif')),
                            )),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, left: 6, right: 8),
                              child: Text(
                                '${controller.productList[index].node.variants.edges[0].node.product.title}',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 4, left: 6, right: 1),
                                  child: Text(
                                    '\$ ${controller.productList[index].node.variants.edges[0].node.price} ',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 6, right: 8),
                                  child: Text(
                                    '10 %off',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'JosefinSans',
                                        color: Colors.green,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
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
  }
}
