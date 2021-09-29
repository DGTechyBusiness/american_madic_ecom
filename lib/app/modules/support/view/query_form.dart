import 'package:flutter/material.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class QueryForm extends StatelessWidget {
  Widget queryForm;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    viewWidgets();
    return Scaffold(
      appBar: AppBar(title: Text('What is your Query?')),
      body: queryForm,
    );
  }

  viewWidgets() {
    queryForm = ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              MyWidgets.textView('Enter your Query', Colors.black, 16),
              SizedBox(height: 20),
              //name
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 50,
                // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                child: TextFormField(
                    // controller:
                    // _registerController.nameController,
                    // validator: (value) => value.isEmpty
                    //     ? "Please enter name"
                    //     : null,
                    decoration: InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
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
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: new BorderSide(color: AppColors.themeColor)),
                )),
              ),
              SizedBox(height: 20),
              //query TextField

              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 4),
                      width: 20,
                      height: 50,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          // controller:
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,
                          decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        labelText: 'Mobile Number',
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                new BorderSide(color: AppColors.themeColor)),
                      )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4, right: 15),
                      height: 50,
                      // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 70.0),
                      child: TextFormField(
                          // controller:
                          // _registerController.nameController,
                          // validator: (value) => value.isEmpty
                          //     ? "Please enter name"
                          //     : null,
                          decoration: InputDecoration(
                        hintText: 'Alternative number',
                        labelText: 'Alter native number',
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                new BorderSide(color: AppColors.themeColor)),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Container(
                height: 80,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  // controller:
                  // _registerController.mobileController,
                  // validator: (value) => value.isEmpty
                  //     ? 'Please enter mobile number'
                  //     : value.length < 10
                  //     ? 'Please enter 10 digit number'
                  //     : null,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Query',
                      labelText: 'Query',
                      labelStyle: TextStyle(
                        fontSize: 13,
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w400,
                        // light
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: new BorderSide(color: AppColors.themeColor)),
                    )),
              ),
              SizedBox(height: 10),
              SizedBox(height: 15),
            ],
          ),
        ),
        //Login button
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.only(left: 15, right: 15),
          // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: AppColors.redColor,
              child: Text(
                'SEND QUERY',
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: AppColors.white),
              ),
              onPressed: () {
                // Get.to(PageView());
                MySnackbar.infoSnackBar(
                    'Coming soon', 'Add Address will be coming soon');
                // if (_formKey.currentState.validate()) {
                //
                //  _registerController.getRegister();
                // }

                // Get.offAll(HomePage());

                // print('Email: '+.text+" "+'Password: '+_passwordTextController.text);
              }),
        ),
      ],
    );
  }
}
