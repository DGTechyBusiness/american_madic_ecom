import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/order/order_controller.dart';

class PaymentSuccessfull extends StatelessWidget {
  //const PaymentSuccessfull({Key? key}) : super(key: key);
  String amount, orderFrom, address, quantity, productId, paymentId;


  PaymentSuccessfull(
      this.amount, this.orderFrom, this.address, this.quantity, this.productId, this.paymentId);

  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      if (orderFrom == 'cart') {
        //orderController.
        //address, billingAddress, type, paymentId
        orderController.createOrderCart(address, address, 'cart', paymentId);
      } else {
        //address, billingAddress, type, paymentId, productId, quantity, price
        orderController.createOrder(
            address, address, 'Single', paymentId, productId, quantity, amount);
      }
    });

    return Scaffold(
      // appBar: AppBar(title: Text('Payment successful'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/checked.png',
              scale: 4,
            ),
            SizedBox(height: 50),
            Text(
              'Payment Successful',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Do not press any key, Please wait....',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
