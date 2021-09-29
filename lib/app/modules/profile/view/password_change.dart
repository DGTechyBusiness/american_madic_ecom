import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/profile/controller/profile_controller.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  ProfileController passwordController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Center(
        child: Container(
          height: 300,
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Card(
            color: AppColors.offWhite,
            elevation: 8,
            shadowColor: AppColors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 50, bottom: 50, left: 28, right: 28),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        //Password TextField
                        Container(
                          height: 50,
                          //  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                          child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: passwordController.enterNewPassword,
                              validator: (value) => value.isEmpty
                                  ? 'Please input a new password'
                                  : null,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter new password',
                                labelText: 'Enter new password',
                                errorStyle: TextStyle(color: Colors.orange),
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w300,
                                  // light
                                  fontStyle: FontStyle.normal,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: AppColors.themeColor)),
                              )),
                        ),
                        SizedBox(height: 20),

                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                  //Login button
                  Container(
                    height: 45,
                    width: double.infinity,
                    // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        color: AppColors.themeColor,
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: AppColors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            passwordController.changePasswordFunc();
                          }

                          // Get.offAll(HomePage());

                          // print('Email: '+.text+" "+'Password: '+_passwordTextController.text);
                        }),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
