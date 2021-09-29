import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/address/view/address_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

import '../controller/cart_controller.dart';

class CartView extends StatefulWidget {
  //const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.put(CartController());
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getItems(),
      appBar: AppBar(title: Text('Cart')),
      body: SafeArea(
        child: LimitedBox(
          maxHeight: double.infinity,
          child: ListView(
            children: [
              SizedBox(height: 20),
              getOrderTrack(),
              SizedBox(height: 25),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: MyWidgets.textView(
                        'Products in cart', Colors.black, 14),
                  )),
              SizedBox(height: 10),
              cartList(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  cartList() {
    return GetX<CartController>(initState: (context) {
      cartController.fetchCartListProducts();
    }, builder: (controller) {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        //if(controller.cartListProducts.isEmpty){
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.cartListProductsList.length,
            itemBuilder: (context, index) {
              //String name, String price, String img, int stock

              return getCartItems(
                  controller.cartListProductsList[index].product.data.product.title,
                  controller.cartListProductsList[index].product.data.product
                      .variants.edges[0].node.price,
                  controller.cartListProductsList[index].product.data.product
                      .featuredImage.originalSrc,
                  controller.cartListProducts.value.list[index].quantity.toString(),
                  controller.cartListProductsList[index].product.data.product.totalInventory,
                  index);
                  // controller.cartListProducts.value.list[index].product.data
                  //     .product.title,
                  // controller.cartListProducts.value.list[index].product.data
                  //     .product.variants.edges[0].node.price,
                  // controller.cartListProducts.value.list[index].product.data
                  //     .product.featuredImage.originalSrc,
                  // controller.cartListProducts.value.list[index].product.data
                  //     .product.totalInventory,
                  // index);
            });
        // Center(child: Padding(
        //           padding: const EdgeInsets.only(top:220),
        //           child: Text('No products in cart'),
        //         ),);

      }

      // else{
      //   return
      //     Center(child: Padding(
      //         padding: const EdgeInsets.only(top:220),
      //         child: Text('No products in cart'),
      //       ),);
      // }

      //       :
      // }
    });
  }

  getCartItems(String name, String price, String img, String quanty, int stock, int index) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.themeColor,
      margin: EdgeInsets.all(4),
      child: Container(
        height: 150,
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
                  child: Expanded(
                    child: Text(
                      name,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: Text(
                    'Mfg: Company name',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                ),
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
                        top: 2, bottom: 10, left: 6, right: 8),
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
                          )),
                Row(
                  children: [
                    MyWidgets.textView(
                        //' ${cartController.selectedQnty.value} ',
                        'Total Quantity: $quanty',
                        Colors.black87,
                        12,
                        fontWeight: FontWeight.w400),
                    SizedBox(width: 50),
                    InkWell(
                        onTap: () {
                          cartController.deleteCart(
                              cartController.cartListProducts.value.list[index].cartId);
                          cartController.cartListProductsList.removeAt(index);
                          getItems();
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),

                // Row(
                //   children: [
                //
                //     //Obx(() =>
                //
                //         Container(
                //           child: Row(
                //             children: [
                //               GestureDetector(
                //                 child: Card(
                //                   child: Icon(Icons.add_box_rounded,
                //                       color: Colors.white),
                //                   color: Colors.black54,
                //                 ),
                //                 onTap: () {
                //                   print('increament $index');
                //                   cartController.incremnetQnty(index);
                //                   print('cart qnty right now : ${cartController.incremnetQnty(index)}');
                //                 },
                //               ),
                //               Obx(()=>
                //                   MyWidgets.textView(
                //                       //' ${cartController.selectedQnty.value} ',
                //                       '${cartController.cartListProducts[index].quantity.toString()}',
                //                       Colors.black87,
                //                       17,
                //                       fontWeight: FontWeight.w800),
                //               ),
                //               GestureDetector(
                //                 onTap: () {
                //                   //cartController.cartListProducts[0]
                //                   cartController.decreamentQnty();
                //                 },
                //                 child: Card(
                //                   child: Icon(Icons.indeterminate_check_box,
                //                       color: Colors.white),
                //                   color: Colors.black54,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //
                //     //),
                //
                //
                //     SizedBox(width: 80),
                //     Icon(Icons.delete, color: Colors.red)
                //   ],
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getOrderTrack() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 1),
        MyWidgets.mySingleTrack('Cart  ', 'assets/images/check_green.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Address  ', 'assets/images/check.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Payment  ', 'assets/images/check.svg',
            imgWidth: 18),
        SizedBox(width: 2)
      ],
    ));
  }

  getItems() {
    return GetX<CartController>(initState: (context) {
      cartController.fetchCartListProducts();
    }, builder: (controller) {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        if(controller.cartListProducts.value.total ==null){
          return
          Center(child: Text('No products in cart'),);
        }else{
          return Container(
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //controller.cartListProducts.value.total
                      //double.parse(distance.toStringAsFixed(2)
                      MyWidgets.textView(
                          '\$ ${double.parse(controller.cartListProducts.value.total.toStringAsFixed(2))}',
                          Colors.black,
                          18,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 4),
                      MyWidgets.textView('Payble amount', Colors.blue, 12,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 60),
                    child: Container(
                      height: 40,
                      child: RaisedButton(
                          color: AppColors.redColor,
                          child: MyWidgets.textView('Checkout', Colors.white, 14),
                          onPressed: () {
                            Get.to(AddressView(double.parse(controller.cartListProducts.value.total.toStringAsFixed(2)).toString(),'cart'));
                          }),
                    ),
                  ),
                )
              ],
            ),
          );
        }

      }
    });
    // Center(child: Padding(
    //           padding: const EdgeInsets.only(top:220),
    //           child: Text('No products in cart'),
    //         ),);
  }
}
