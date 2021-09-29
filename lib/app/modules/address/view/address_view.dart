import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/address/address_controller.dart';
import 'package:shree_pharmacy/app/modules/payment/view/payment_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class AddressView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String amount, productId, quantity, orderFrom;

  AddressView(this.amount, this.orderFrom, {this.productId, this.quantity});

  AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getBottomAddressFrom();
        },
        backgroundColor: AppColors.redColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Select Address'),
      ),
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
                        'Available addresses', Colors.black, 14),
                  )),
              getAddressList()
            ],
          ),
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
        MyWidgets.mySingleTrack('Cart  ', 'assets/images/check.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Address  ', 'assets/images/check_green.svg',
            imgWidth: 18),
        Container(width: 45, height: 1, color: Colors.black),
        MyWidgets.mySingleTrack('Payment  ', 'assets/images/check.svg',
            imgWidth: 18),
        SizedBox(width: 2)
      ],
    ));
  }

  viewAddAddressField() {
    //address:address
    // user_id:7
    // state:Statew
    // city:durgapur
    // country:India
    // zip:7894561
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              MyWidgets.textView('Add new address', Colors.black, 16),
              SizedBox(height: 15),
              //address TextField
              Container(
                height: 48,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                    controller: addressController.address,
                    // _registerController.mobileController,
                    // validator: (value) => value.isEmpty
                    //     ? 'Please enter mobile number'
                    //     : value.length < 10
                    //     ? 'Please enter 10 digit number'
                    //     : null,
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        fontSize: 13,
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w400,
                        // light
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              new BorderSide(color: AppColors.themeColor)),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 4),
                      width: 20,
                      height: 48,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          controller: addressController.state,
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,

                          //address:address
                          // user_id:7
                          // state:Statew
                          // city:durgapur
                          // country:India
                          // zip:7894561
                          decoration: InputDecoration(
                            hintText: 'State',
                            labelText: 'State',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
                              // light
                              fontStyle: FontStyle.normal,
                            ),
                            // OutlineInputBorder(
                            //         borderRadius: const BorderRadius.all(
                            //           const Radius.circular(10.0),
                            //         ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4, right: 15),
                      height: 48,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          controller: addressController.pincode,
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,
                          decoration: InputDecoration(
                            hintText: 'Pincode',
                            labelText: 'Pincode',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
                              // light
                              fontStyle: FontStyle.normal,
                            ),
                            // OutlineInputBorder(
                            //         borderRadius: const BorderRadius.all(
                            //           const Radius.circular(10.0),
                            //         ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 4),
                      width: 20,
                      height: 48,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          controller: addressController.city,
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,
                          decoration: InputDecoration(
                            hintText: 'City',
                            labelText: 'City',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
                              // light
                              fontStyle: FontStyle.normal,
                            ),
                            // OutlineInputBorder(
                            //         borderRadius: const BorderRadius.all(
                            //           const Radius.circular(10.0),
                            //         ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4, right: 15),
                      height: 48,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          controller: addressController.country,
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,
                          decoration: InputDecoration(
                            hintText: 'Country',
                            labelText: 'Country',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w400,
                              // light
                              fontStyle: FontStyle.normal,
                            ),
                            // OutlineInputBorder(
                            //         borderRadius: const BorderRadius.all(
                            //           const Radius.circular(10.0),
                            //         ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: new BorderSide(
                                    color: AppColors.themeColor)),
                          )),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Container(
                height: 48,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: AppColors.redColor,
                    child: Text(
                      'ADD ADDRESS',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: AppColors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addressController.addAddress();
                      }
                    }),
              ),
            ],
          ),
        ),
        //Login button

      ],
    );
  }

  getAddressList() {
    return GetX<AddressController>(initState: (context) {
      addressController.fetchAddressList();
    }, builder: (controller) {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        //if(controller.cartListProducts.isEmpty){
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.addressList.length,
            itemBuilder: (context, index) {
              //String name, String price, String img, int stock
              String fullAddress = '${controller.addressList[index].address}\n'
                  '${controller.addressList[index].city}, '
                  '${controller.addressList[index].state}\n '
                  '${controller.addressList[index].zip}, '
                  '${controller.addressList[index].country}, ';

              return addressListItem(controller.addressList[index].name,
                  controller.addressList[index].phone, fullAddress);
            });
      }
    });
  }

  addressListItem(String name, String phone, String address) {
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
                  child: MyWidgets.textView('Deliver Here', Colors.white, 14),
                  onPressed: () {
                    Get.off(PaymentView(
                      name,
                      phone,
                      address,
                      amount,
                      orderFrom: orderFrom,
                      productId: productId,
                      quantity: quantity,
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void getBottomAddressFrom() {
    Get.bottomSheet(
        Container(
          width: double.infinity,
          height: double.maxFinite,
          child: viewAddAddressField(),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ));
  }
}
