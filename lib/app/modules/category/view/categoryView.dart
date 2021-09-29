import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/home/controllers/category_controller.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_view.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('All Categories')),
        body:

        LimitedBox(
          child: ListView(
            children: [
              GetX<CategoryController>(
                initState: (context) {},
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 8.0 / 12.0,
                      children: new List<Widget>.generate(
                          controller.categoryList.length, (index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductView(
                                controller.categoryList[index].node.id,
                                controller.categoryList[index].node.title));
                          },
                          child:
                          controller.categoryList[index].node.title != 'Home page'||
                          controller.categoryList[index].node.title != 'All Products'?

                          GridTile(
                            child: Card(
                                elevation: 0,
                                margin: EdgeInsets.all(2),
                                child: new Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 2.0),
                                      Expanded(
                                        child:
                                        controller
                                            .categoryList[index].node.image != null?
                                        FadeInImage(
                                            fit: BoxFit.fill,
                                            image:
                                            NetworkImage(controller
                                                .categoryList[index].node.image.originalSrc),

                                            placeholder: AssetImage(
                                                'assets/images/loading.gif'))
                                            : Image.asset('assets/images/logo.png'),
                                      ),

                                      // Image.network(controller
                                      //     .categoryList[index].image)),

                                      SizedBox(height: 10.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 6,
                                            right: 8),
                                        child: Text(
                                          controller.categoryList[index].node.title,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ):Container()
                        );
                      }),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
