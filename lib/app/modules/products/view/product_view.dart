import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/modules/products/controller/product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_details_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class ProductView extends StatelessWidget {
  String categoryId;
  String categoryName;
  var box = GetStorage();

  ProductView(this.categoryId, this.categoryName);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: LimitedBox(
          maxHeight: double.infinity,
          child: GetX<ProductController>(
            initState: (context) {
              productController.fetchProducts(categoryId, '', '');

            },
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return controller.productList.isEmpty
                    ? Center(
                        child: Text('No Products in $categoryName'),
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: [
                          GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 8.0 / 12.0,
                            //productList[index].node.variants.edges[0]
                            //controller.productList.length
                            children: new List<Widget>.generate(
                                controller.productList.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  if(box.read('login')=='true'){
                                    Get.to(ProductDetailsView(
                                        controller.productList[index].node
                                            .variants.edges[0].node.product.id,
                                        controller.productList[index].node
                                            .variants.edges[0].node.price
                                            .toString(),
                                        controller
                                            .productList[index]
                                            .node
                                            .variants
                                            .edges[0]
                                            .node
                                            .inventoryQuantity
                                            .toString(),
                                        controller
                                            .productList[index]
                                            .node
                                            .variants
                                            .edges[0]
                                            .node
                                            .product
                                            .featuredImage
                                            .originalSrc,
                                        controller.productList[index].node
                                            .variants.edges[0].node.product.title,
                                        categoryId: categoryId));
                                  }else{
                                    Get.to(LoginView());
                                    MySnackbar.infoSnackBar('You have to login first', 'please login for further process');
                                  }

                                },
                                child: new GridTile(
                                  child: new Card(
                                      elevation: 1,
                                      shadowColor: AppColors.themeColor,
                                      margin: EdgeInsets.all(4),
                                      child: new Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  placeholder: AssetImage(
                                                      'assets/images/loading.gif')),
                                            )),
                                            SizedBox(height: 10.0),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2,
                                                  bottom: 2,
                                                  left: 6,
                                                  right: 8),
                                              child: Text(
                                                '${controller.productList[index].node.variants.edges[0].node.product.title}',
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6,
                                                          bottom: 4,
                                                          left: 6,
                                                          right: 1),
                                                  child: Text(
                                                    '\$ ${controller.productList[index].node.variants.edges[0].node.price} ',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6,
                                                  bottom: 8,
                                                  left: 6,
                                                  right: 8),
                                              child: controller
                                                          .productList[index]
                                                          .node
                                                          .variants
                                                          .edges[0]
                                                          .node
                                                          .inventoryQuantity ==
                                                      0
                                                  ? Text(
                                                      '  Out of Stock',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12),
                                                    )
                                                  : Text(
                                                      '  In Stock ${controller.productList[index].node.variants.edges[0].node.inventoryQuantity}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12),
                                                    ),
                                            ),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              productController.data.collection.products
                                          .pageInfo.hasPreviousPage ==
                                      true
                                  ? FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        productController.fetchProducts(
                                            categoryId,
                                            productController
                                                .productList[0].cursor,
                                            'before');
                                      },
                                      child: Text(
                                        'Prev',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : Container(),
                              productController.data.collection.products
                                          .pageInfo.hasNextPage == true
                                  ? FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        productController.fetchProducts(
                                            categoryId,
                                            productController
                                                .productList[4].cursor,
                                            'after');
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      );
              }
            },
          ),
        ));
  }
}

/*

Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productController.data.collection.products.pageInfo
                              .hasPreviousPage ==
                          true
                      ? FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            productController.fetchProducts(categoryId,
                                productController.productList[0].cursor);
                          },
                          child: Text(
                            'Prev',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : Container(),
                  productController
                              .data.collection.products.pageInfo.hasNextPage ==
                          true
                      ? FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            productController.fetchProducts(categoryId,
                                productController.productList[4].cursor);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : Container(),
                ],
              )

 */
