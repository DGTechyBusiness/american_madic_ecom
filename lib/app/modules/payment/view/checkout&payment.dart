import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

import '../payment-service.dart';
import '../payment_successful.dart';

class CheckoutAndPayment extends StatefulWidget {
  //const CheckoutAndPayment({Key? key}) : super(key: key);
  String amount, orderFrom, address, quantity, productId;


  CheckoutAndPayment(
      this.amount, this.orderFrom, this.address, this.quantity, this.productId);

  @override
  _CheckoutAndPaymentState createState() => _CheckoutAndPaymentState();
}

class _CheckoutAndPaymentState extends State<CheckoutAndPayment> {
  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout and Payment',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 4),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('Total', Colors.black87, 14),
                      MyWidgets.textView(
                          '\$ ${widget.amount}', Colors.black87, 14,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            Divider(thickness: 1),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('Discount', Colors.black87, 14),
                      MyWidgets.textView('-\$ 0.0', Colors.green, 14,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            Divider(thickness: 1),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('COD charge', Colors.black87, 14),
                      MyWidgets.textView('\$ 0.0', Colors.black87, 14,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            Divider(thickness: 1),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('Shipping charge', Colors.black87, 14),
                      MyWidgets.textView('\$ 0.0', Colors.black87, 14,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            Divider(thickness: 1),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('Total Savings', Colors.green, 14,
                          fontWeight: FontWeight.bold),
                      MyWidgets.textView('\$ 0.0', Colors.green, 14,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            Divider(thickness: 1),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView(
                          'Total Payable amount', Colors.black, 16,
                          fontWeight: FontWeight.bold),
                      MyWidgets.textView(
                          '\$ ${widget.amount}', Colors.black, 16,
                          fontWeight: FontWeight.bold)
                    ],
                  )),
            ),
            SizedBox(height: 20),
            Container(
              height: 42,
              width: double.infinity,
              child: RaisedButton(
                  color: AppColors.redColor,
                  onPressed: () {
                    // Get.back();
                    // if (widget.orderFrom == 'cart') {
                    //   //orderController.
                    //   orderController.createOrderCart(
                    //       address, address, 'cart', 'COD');
                    // } else {
                    //   orderController.createOrder(address, address, 'Single',
                    //       'COD', productId, quantity, payableAmount);
                    // }

                    //Get.to(OrderSuccess());
                    payViaNewCard(context);
                  },
                  child:
                      MyWidgets.textView('Confirm Payment', Colors.white, 16)),
            ),
          ],
        ),
      ),
    );
  }

  payViaNewCard(BuildContext context) async {
    double doubleAmount = double.parse(widget.amount)*100;
    int paybaleAmount = doubleAmount.round();
    //double payableAmount = double.parse(widget.amount*100).toInt();
    print('payable amount in checkout: $paybaleAmount');
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: paybaleAmount.toString(), currency: 'USD');
    await dialog.hide();
    if (response.message == 'Transaction successful') {
      //amount, orderFrom, address, quantity, productId;
      Get.off(PaymentSuccessfull(widget.amount, widget.orderFrom, widget.address, widget.quantity, widget.productId, response.paymentId));
      // print('payment response: ${response.message}');
      // MySnackbar.successSnackBar('title', response.paymentId);

    }else{
      MySnackbar.errorSnackBar('Transaction failed', 'Your transaction was failed, try again after sometime');
    }
  }
}
