import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shree_pharmacy/app/modules/login/controllers/login_controller.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/modules/profile/controller/profile_controller.dart';
import 'package:shree_pharmacy/app/modules/profile/view/edit_profile.dart';
import 'package:shree_pharmacy/app/modules/profile/view/password_change.dart';
import 'package:shree_pharmacy/app/modules/support/view/support_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';


class AccountView extends StatefulWidget {
  //const AccountView({Key? key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  ProfileController controller = ProfileController();
  var box = GetStorage();
  var loginStatus;
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    setState(() {
     loginStatus = loginController.name.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: loginStatus.isEmpty ||
            loginStatus == 'Login' ||
            loginStatus == 'null'?
        Container(child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are not logged in'),
            SizedBox(height: 15),
            Text('Please login or create your account'),
            SizedBox(height: 20),
            Container(
              height: 45,
              width: 150,
              // margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: AppColors.themeColor,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.white),
                  ),
                  onPressed: () {
                     Get.to(LoginView());
                  }),
            ),
          ],
        )),):
        ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Obx(() {
                  return controller.selectedImagePath.value == ''
                      ? ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: CachedNetworkImage(
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      imageUrl: 'https://www.gstatic.com/webp/gallery3/2.png',
                      placeholder: (context, url) => Image.asset(
                        'assets/images/loading.gif',
                        fit: BoxFit.fitWidth,
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.account_circle_rounded,
                        size: 48.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )
                      : ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Image.file(
                        File(controller.selectedImagePath.value),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ));
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 60),
                      InkWell(
                          onTap: () {
                            controller.getImage(ImageSource.gallery);
                          },
                          child: SvgPicture.asset(
                            'assets/images/change.svg',
                            width: 22,
                            height: 22,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                  child: Card(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Personal Details',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            (box.read('name')==null ?
                            Text(
                              'Guest',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),

                            ):
                            Text(
                              'Name : ${box.read('name')}',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                            )),


                            SizedBox(height: 6),
                            box.read('email')==null?
                            Text(
                              'Email : Not available',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                            ):
                            Text(
                              'Email : ${box.read('email')}',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            SizedBox(height: 6),

                            box.read('mobile')==null?
                            Text(
                              'Mobile : Not available',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                            ):
                            Text(
                              'Mobile : ${box.read('mobile')}',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                            ),


                            SizedBox(height: 6),
                            (box.read('bDay')) == null
                                ? Text(
                              'DOB : Not available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            )
                                : Text(
                              'DOB : ${box.read('bDay')}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => Get.to(() => EditProfile()),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0, top: 10, bottom: 10),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                  child: Card(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: [
                              SizedBox(height: 16),

                              box.read('email')==null?Text(''):
                              InkWell(
                                onTap: (){
                                  Get.to(LoginView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.group_add,
                                        color: AppColors.themeColor,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Use another account',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: AppColors.themeColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(ChangePasswordView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.app_registration,
                                        color: AppColors.themeColor,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: AppColors.themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(SupportView(contextFrom: 'fromAccount'));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.help_center_outlined,
                                        color: AppColors.themeColor,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Need Help',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: AppColors.themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.offAll(LoginView());
                                  MySnackbar.infoSnackBar('Logged Out', 'you are logged out successfully');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: AppColors.themeColor,
                                      ),
                                      SizedBox(width: 6),
                                      box.read('email')==null ?
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: AppColors.themeColor),
                                      ):
                                      Text(
                                        'Log out',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: AppColors.themeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16)
                            ],
                          ),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      );
  }
}

