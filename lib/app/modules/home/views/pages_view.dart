import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share/share.dart';
import 'package:shree_pharmacy/app/modules/address/view/store_locator.dart';
import 'package:shree_pharmacy/app/modules/cart/views/cart_views.dart';
import 'package:shree_pharmacy/app/modules/home/views/visit_view.dart';
import 'package:shree_pharmacy/app/modules/login/controllers/login_controller.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/modules/policies/views/privacy_policy.dart';
import 'package:shree_pharmacy/app/modules/policies/views/return_policy.dart';
import 'package:shree_pharmacy/app/modules/policies/views/terms_condition.dart';
import 'package:shree_pharmacy/app/modules/profile/view/account_view.dart';
import 'package:shree_pharmacy/app/modules/home/views/home_view.dart';
import 'package:shree_pharmacy/app/modules/home/views/order_view.dart';
import 'package:shree_pharmacy/app/modules/support/view/support_view.dart';
import 'package:shree_pharmacy/app/modules/wishlist/views/save_products.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class PagesView extends StatefulWidget {
  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  LoginController loginController = Get.put(LoginController());

  List<Widget> _screens = [
    HomeView(),
    SupportView(),
    OrderView(),
    VisitView(),
    AccountView()
  ];

  int _selectedIndex = 0;
  var box = GetStorage();

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedItem) {
    print(selectedItem);
    _pageController.jumpToPage(selectedItem);
  }

  @override
  void initState() {
    loginController.name.value = box.read('name').toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: getDrawer(),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          width: 80,
        ),
        backgroundColor: AppColors.white,
        actions: [
          //Container(color:Colors.deepPurple,child: Text('data')),
          Obx(
            () => loginController.name.value.isEmpty ||
                    loginController.name.value == 'Login' ||
                    loginController.name.value == 'null'
                ? IconButton(
                    icon: SvgPicture.asset('assets/images/user.svg'),
                    color: Colors.teal,
                    onPressed: () {
                      Get.to(() => LoginView());
                    })
                : InkWell(
                    onTap: () {
                      Get.to(() => LoginView());
                    },
                    child: Center(
                      child: Text(
                        loginController.name.value,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )),
          ),

          // box.hasData('userId')?
          // Text('fghjkl'):

          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: AppColors.themeColor,
              onPressed: () {
                //Get.to(FlutterExample());
                Get.to(() => CartView());
              }),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedFontSize: 16,
        onTap: _onItemTapped,
        items: [
          // /   HomeView(),
          //     TopBrandView(),
          //     OrderView(),
          //     AccountView()
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,
                color: _selectedIndex == 0
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade400),
            title: Text(
              'Home',
              style: TextStyle(
                  color: _selectedIndex == 0
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade400,
                  fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent,
                color: _selectedIndex == 1
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade400),
            title: Text(
              'Support',
              style: TextStyle(
                  color: _selectedIndex == 1
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade400),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart,
                color: _selectedIndex == 2
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade400),
            title: Text(
              'Order',
              style: TextStyle(
                  color: _selectedIndex == 2
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade400),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined,
                size: 28,
                color: _selectedIndex == 3
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade400),
            title: Text(
              'Visit',
              style: TextStyle(
                  color: _selectedIndex == 3
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade400),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
                color: _selectedIndex == 4
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade400),
            title: Text(
              'Account',
              style: TextStyle(
                  color: _selectedIndex == 4
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade400,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDrawer() {
    // String userName = box.read('name');
    // String email = box.read('email');
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          // accountName: Text(box.read('name')),
          // accountEmail: Text(box.read('email')),
          accountName: Text('Guest User'),
          accountEmail: Text('Guest email'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.white,
            child: Icon(Icons.person),
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(SaveProductView());
          },
          title: Text('Save Products'),
          leading: Icon(Icons.save),
        ),
        ListTile(
          onTap: () {
            Get.to(OrderView());
          },
          title: Text('My order'),
          leading: Icon(Icons.bookmark_border),
        ),
        ListTile(
          onTap: () {
            Get.to(ReturnPolicy());
          },
          title: Text('Return Policy'),
          leading: Icon(Icons.save),
        ),
        ListTile(
          onTap: () {
            Get.to(StoreLocator());
          },
          title: Text('Store Locator'),
          leading: Icon(Icons.location_on),
        ),
        ListTile(
          onTap: () {
            Get.to(PrivacyPolicy());
          },
          title: Text('Privacy & policy'),
          leading: Icon(Icons.policy),
        ),
        ListTile(
          onTap: () {
            Get.to(TermsCondition());
          },
          title: Text('Terms & condition'),
          leading: Icon(Icons.branding_watermark_sharp),
        ),
        ListTile(
          onTap: () {
            Share.share(
                'Download our app \n\nhttps://play.google.com/store/apps/details?id=com.jaataa');
          },
          title: Text('Share app'),
          leading: Icon(Icons.share),
        ),
        ListTile(
          onTap: () {
            //  _launchURL();
          },
          title: Text('Rate us'),
          leading: Icon(Icons.star_rate),
        ),
        // ListTile(
        //   onTap: () {
        //     Get.to(SupportView(
        //       contextFrom: 'drawer',
        //     ));
        //   },
        //   title: Text('Contact us'),
        //   leading: Icon(Icons.contact_page),
        // ),
        ListTile(
          onTap: () {
            box.erase();
            // box.write('isNewUser', 'true');
            loginController.name.value = 'Login';
            box.write('isNewUser', 'true');
            Get.back();

            //Get.to(SupportView(contextFrom: 'drawer',));
          },
          title: Text('Logout'),
          leading: Icon(Icons.logout),
        ),
      ],
    );
  }
}
