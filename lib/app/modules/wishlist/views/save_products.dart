import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_details_view.dart';
import 'package:shree_pharmacy/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class SaveProductView extends StatelessWidget {
  WishListController wishListController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Save Products')),
      body: SafeArea(
        child: LimitedBox(
          maxHeight: double.infinity,
          child: saveProductList(),
        ),
      ),
    );
  }

  saveProductList() {
    return GetX<WishListController>(
      initState: (context) {
        wishListController.fetchWishlistProducts();
      },
      builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.wishListProducts.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      //String productId, price, stock, image, name, categoryId;
                      Get.to(ProductDetailsView(
                          controller.wishListProducts[index].data.product.id,
                          controller.wishListProducts[index].data.product
                              .variants.edges[0].node.price
                              .toString(),
                          controller.wishListProducts[index].data.product
                              .totalInventory
                              .toString(),
                          controller.wishListProducts[index].data.product
                              .featuredImage.originalSrc
                              .toString(),
                          controller.wishListProducts[index].data.product.title
                              .toString()));
                    },
                    child: saveProductItem(
                        controller.wishListProducts[index].data.product.title
                            .toString(),
                        controller.wishListProducts[index].data.product.variants
                            .edges[0].node.price
                            .toString(),
                        controller.wishListProducts[index].data.product
                            .featuredImage.originalSrc
                            .toString(),
                        controller.wishListProducts[index].data.product
                            .totalInventory));
              });
        }
      },
    );
  }

  saveProductItem(String name, String price, String img, int stock) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.themeColor,
      margin: EdgeInsets.all(4),
      child: Container(
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Container(
              width: 100,
              child: FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(img),
                  placeholder: AssetImage('assets/images/loading.gif')),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: Text(
                    name,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 2, bottom: 2, left: 6, right: 8),
                //   child: Text(
                //     'Mfg: Company name',
                //     textAlign: TextAlign.center,
                //     maxLines: 2,
                //     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                //   ),
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 4, left: 6, right: 1),
                      child: Text(
                        '\$. $price',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 10, bottom: 10, left: 6, right: 8),
                    //   child: Text(
                    //     '20 %off',
                    //     textAlign: TextAlign.center,
                    //     maxLines: 1,
                    //     style: TextStyle(
                    //         fontFamily: 'JosefinSans',
                    //         color: Colors.green,
                    //         fontWeight: FontWeight.w800,
                    //         fontSize: 14),
                    //   ),
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 8, left: 6, right: 8),
                  child: stock == 0
                      ? Text(
                          'Out of Stock',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        )
                      : Text(
                          'In Stock $stock',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    MySnackbar.infoSnackBar(
                        'Coming soon', 'Delete option coming soon');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyWidgets.textView(
                          'Remove from wishlist', Colors.red, 12),
                      SizedBox(width: 10),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
