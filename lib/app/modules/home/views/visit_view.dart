import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/address/view/store_locator.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class VisitView extends StatelessWidget {
Widget storeItem;
Widget storeList;

  @override
  Widget build(BuildContext context) {
    viewWidgets();
    return Scaffold(
      body: Center(
        child: Scaffold(
          body: SafeArea(
            child: LimitedBox(
              maxHeight: double.infinity,
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: MyWidgets.textView(
                            'Available stores near you', Colors.black, 14),
                      )),
                  SizedBox(height: 10),
                  storeList,
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  viewWidgets(){
    storeList = ListView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index){
      return storeItem;
    });

    storeItem = Card(
      elevation: 2,
      shadowColor: AppColors.themeColor,
      margin: EdgeInsets.all(4),
      child: Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Image.asset(
              'assets/images/store.jpg',
              width: 110,
              height: 110,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: Text(
                    'Nutri Shope',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: MyWidgets.textView(
                      'Iris Watson'
                          '\nP.O. Box 283 8562 Fusce Rd.'
                          '\nFrederick Nebraska 20620'
                          '\ncontact: (372) 587-2335',
                      Colors.black,
                      12),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyWidgets.textView(' Open Now', Colors.green, 12, fontWeight: FontWeight.bold),
                    MyWidgets.textView('        Closes 9.00pm', Colors.black54, 12)
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      height:30,
                      onPressed: (){
                        MySnackbar.infoSnackBar('Coming soon', 'Contact option coming soon');
                      },
                      child: Text('Contact', style: TextStyle(
                          color: Colors.black, fontSize: 13
                      )
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(side: BorderSide(
                          color: AppColors.themeColorLight,
                          width: 1,
                          style: BorderStyle.solid
                      ), borderRadius: BorderRadius.circular(4)),
                    ),
                    SizedBox(width: 15),
                    FlatButton(
                      height:30,
                      onPressed: (){
                        Get.to(StoreLocator());
                      },
                      child: Text('Direction', style: TextStyle(
                          color: Colors.black, fontSize: 13
                      )
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(side: BorderSide(
                          color: AppColors.themeColorLight,
                          width: 1,
                          style: BorderStyle.solid
                      ), borderRadius: BorderRadius.circular(4)),
                    ),
                  ],
                )


              ],
            ),
          ],
        ),
      ),
    );
  }
}
