import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/address/view/address_view.dart';
import 'package:shree_pharmacy/app/modules/order/order_controller.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';
import 'checkout&payment.dart';

class PaymentView extends StatelessWidget {
  Widget orderTrack;
  Widget amountSummery;
  Widget paymentMethod;

  //Order data
  String name, phone, address, amountrs, orderFrom, productId, quantity;

  PaymentView(this.name, this.phone, this.address, this.amountrs,
      {this.orderFrom, this.productId, this.quantity});

  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    viewWidgets(context);
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: SafeArea(
        child: LimitedBox(
          maxHeight: double.infinity,
          child: ListView(
            children: [
              SizedBox(height: 20),
              orderTrack,
              SizedBox(height: 25),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        MyWidgets.textView('Payment method', Colors.black, 14),
                  )),
              SizedBox(height: 10),
              addressListItem(name, phone, address, amountrs),
              SizedBox(height: 10),
              amountSummery,
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: MyWidgets.textView(
                    'Choose payment method', Colors.black, 14),
              ),
              paymentMethod
            ],
          ),
        ),
      ),
    );
  }

  viewWidgets(BuildContext context) {
    orderTrack = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 1),
        MyWidgets.mySingleTrack('Cart  ', 'assets/images/check.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Address  ', 'assets/images/check.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Payment  ', 'assets/images/check_green.svg',
            imgWidth: 18),
        SizedBox(width: 2)
      ],
    ));
    amountSummery = Card(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ExpandablePanel(
          header: MyWidgets.textView(
              'Total Payable Amount  -   \$ $amountrs', Colors.black, 16,
              fontWeight: FontWeight.w700),
          collapsed:
              MyWidgets.textView('including all taxes', Colors.black87, 14),
          expanded: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyWidgets.textView('Total', Colors.black87, 14),
                          MyWidgets.textView(
                              '\$ $amountrs', Colors.black87, 14,
                              fontWeight: FontWeight.bold)
                        ],
                      )),
                ),
                Divider(thickness: 1),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyWidgets.textView(
                              'Shipping charge', Colors.black87, 14),
                          MyWidgets.textView('\$ FREE', Colors.black87, 14,
                              fontWeight: FontWeight.bold)
                        ],
                      )),
                ),
                Divider(thickness: 1),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyWidgets.textView('Total Savings', Colors.green, 14,
                              fontWeight: FontWeight.bold),
                          MyWidgets.textView(
                              '\$ $amountrs', Colors.green, 14,
                              fontWeight: FontWeight.bold)
                        ],
                      )),
                ),
              ],
            ),
          ),
          tapHeaderToExpand: true,
          hasIcon: true,
        ),
      ),
    );
    paymentMethod = Column(
      children: [
        InkWell(
          onTap: () {
            getConfirmOrder();
          },
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4)),
            elevation: 1.5,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              child: Align(
                  alignment: Alignment.center, child: Text('Cash on Delivery')),
            ),
          ),
        ),
        InkWell(
          onTap: () {

          print('payment view: Total amount: $amountrs, quantity: $quantity');

            Get.off(CheckoutAndPayment(amountrs, orderFrom, address, quantity, productId));
          },
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4)),
            elevation: 1.5,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              color: Colors.deepPurple,
              height: 50,
              width: double.infinity,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Pay using Stripe',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.security,
              color: Colors.green,
            ),
            MyWidgets.textView('The Payment will be completely safe and secure',
                Colors.black87, 12),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  confirmOrderDialog(String amount) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child:

      Column(
        children: [
          SizedBox(height: 4),
          MyWidgets.textView('Note: You need to pay \$ 20 for cash on delivery',
              Colors.black54, 12),
          SizedBox(height: 15),
          Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.textView('Total', Colors.black87, 14),
                    MyWidgets.textView('\$ $amount', Colors.black87, 14,
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
                    MyWidgets.textView('Total Payable amount', Colors.black, 16,
                        fontWeight: FontWeight.bold),
                    MyWidgets.textView('\$ $amount', Colors.black, 16,
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
                  Get.back();
                  if (orderFrom == 'cart') {
                    //orderController.
                    //address, billingAddress, type, paymentId
                    orderController.createOrderCart(
                        address, address, 'cart', 'COD');
                  } else {
                    //address, billingAddress, type, paymentId, productId, quantity, price
                    orderController.createOrder(address, address, 'Single',
                        'COD', productId, quantity, amountrs);
                  }

                  //Get.to(OrderSuccess());
                },
                child: MyWidgets.textView('Place Order', Colors.white, 16)),
          ),
        ],
      ),
    );
  }

  getConfirmOrder() {
    Get.bottomSheet(
        Container(
          width: double.infinity,
          height: double.maxFinite,
          child: confirmOrderDialog(amountrs),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ));
  }

  addressListItem(String name, String phone, String address, String amount) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      width: double.infinity,
      child: Card(
        shadowColor: AppColors.themeColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyWidgets.textView(name, Colors.black, 18),
              SizedBox(height: 8),
              MyWidgets.textView('Contact: $phone', Colors.black, 14),
              SizedBox(height: 8),
              MyWidgets.textView(address, Colors.black, 14),
              SizedBox(height: 10),
              RaisedButton(
                  color: AppColors.redColor,
                  child: MyWidgets.textView('Change Address', Colors.white, 14),
                  onPressed: () {
                    Get.off(AddressView(amount, orderFrom));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
