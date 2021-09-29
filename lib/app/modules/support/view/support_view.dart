import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/support/view/query_form.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_widgets.dart';

class SupportView extends StatelessWidget {
  String contextFrom;

  SupportView({this.contextFrom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: contextFrom != null
            ? AppBar(
                title: Text('Contact Us'),
              )
            : null,
        body: Container(
            child: Column(
          children: [
            SizedBox(height: 40),
            Card(
              color: Colors.green.shade200,
              shape: StadiumBorder(),
              elevation: 6,
              margin: EdgeInsets.all(20),
              child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.support_agent_sharp, size: 30),
                              SizedBox(width: 15),
                              MyWidgets.textView(
                                  'Feel free to call us', Colors.black87, 16)
                            ],
                          ),
                          MyWidgets.textView('Toll free number: 18000000000',
                              Colors.black87, 13)
                        ],
                      ),
                      CircleAvatar(
                          child: Icon(Icons.call, color: Colors.white),
                          radius: 25,
                          backgroundColor: Colors.deepOrange)
                    ],
                  ))),
            ),
            Card(
              color: Colors.blue.shade200,
              shape: StadiumBorder(),
              elevation: 6,
              margin: EdgeInsets.all(20),
              child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                          child: Icon(Icons.chat, color: Colors.green),
                          radius: 25,
                          backgroundColor: Colors.white),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyWidgets.textView(
                                  'Chat with us', Colors.black87, 16),
                              SizedBox(width: 15),
                              Icon(Icons.mark_chat_read, size: 30),
                            ],
                          ),
                          MyWidgets.textView(
                              'You can also chat with us', Colors.black87, 13)
                        ],
                      ),
                      SizedBox(width: 8),
                    ],
                  ))),
            ),
            InkWell(
              onTap: () {
                Get.to(QueryForm());
              },
              child: Card(
                color: Colors.deepOrange.shade200,
                shape: StadiumBorder(),
                elevation: 6,
                margin: EdgeInsets.all(20),
                child: Container(
                    height: 80,
                    width: double.infinity,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.format_align_left, size: 30),
                                SizedBox(width: 15),
                                MyWidgets.textView(
                                    'Send your query', Colors.black87, 16)
                              ],
                            ),
                            MyWidgets.textView(
                                'Please send us your query', Colors.black87, 13)
                          ],
                        ),
                        CircleAvatar(
                            child: Icon(Icons.send, color: Colors.white),
                            radius: 25,
                            backgroundColor: Colors.deepPurple)
                      ],
                    ))),
              ),
            )
          ],
        )));
  }
}
