// import 'package:flutter/material.dart';
//
// class OrderView extends StatelessWidget {
//   String contexFrom;
//
//   OrderView({this.contexFrom});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: contexFrom != null
//           ? AppBar(
//               title: Text('My Order'),
//             )
//           : null,
//       body: Center(
//         child: Text('        My Order Screen\nDevelopment under process'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/order/order_controller.dart';
import 'package:shree_pharmacy/app/modules/products/controller/product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_details_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class OrderView extends StatelessWidget {
  String categoryId;
  String categoryName;

   //OrderView(this.categoryId, this.categoryName);

 OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Order'),
        ),
        body: LimitedBox(
          maxHeight: double.infinity,
          child: ListView(
            children: [
              GetX<OrderController>(
                initState: (context) {
                  orderController.fetchOrderListProducts();
                },
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return

                        ListView.builder(
                          shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.orderList.length,
                            itemBuilder: (context, index){
                          return Card(
                              elevation: 1,
                              shadowColor: AppColors.themeColor,
                              margin: EdgeInsets.all(4),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Center(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            left: 6,
                                            right: 8),
                                        child: Text(
                                          'Order Id: ${controller.orderList[index].orderId}',
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 4,
                                            left: 6,
                                            right: 1),
                                        child: Text(
                                          'Total amount: \$ ${controller.orderList[index].totalPrice}',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6,
                                                bottom: 4,
                                                left: 6,
                                                right: 1),
                                            child: Text(
                                              'Payment Status: ',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 6,
                                                right: 8),
                                            child: Text('${controller.orderList[index].paymentStatus}',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6,
                                            bottom: 4,
                                            left: 6,
                                            right: 1),
                                        child: Text(
                                          'Order Status: ${controller.orderList[index].orderStatus}',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 4,
                                            left: 6,
                                            right: 1),
                                        child: Text(
                                          'Order Created: ${controller.orderList[index].orderDate}',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        });
                  }
                },
              ),
            ],
          ),
        ));
  }
}
