// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:progress_dialog/progress_dialog.dart';
// import 'package:shree_pharmacy/app/modules/payment/existing-cards.dart';
// import 'package:shree_pharmacy/app/modules/payment/payment-service.dart';
//
// class PaymentOptions extends StatefulWidget {
//   //PaymentOptions({Key key}) : super(key: key);
//   String amount, orderFrom;
//
//
//   PaymentOptions(this.amount, this.orderFrom);
//
//   @override
//   PaymentOptionsState createState() => PaymentOptionsState();
// }
//
// class PaymentOptionsState extends State<PaymentOptions> {
//
//   onItemPress(BuildContext context, int index) async {
//     switch(index) {
//       case 0:
//         payViaNewCard(context);
//         break;
//       case 1:
//         Get.to(ExistingCardsPage());
//         break;
//     }
//   }
//
//   payViaNewCard(BuildContext context) async {
//     ProgressDialog dialog = new ProgressDialog(context);
//     dialog.style(
//         message: 'Please wait...'
//     );
//     await dialog.show();
//     var response = await StripeService.payWithNewCard(
//         amount: '1500',
//         currency: 'USD'
//     );
//     await dialog.hide();
//     Scaffold.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response.message),
//           duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
//         )
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     StripeService.init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose payment option', style: TextStyle(fontSize: 16),),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: ListView.separated(
//             itemBuilder: (context, index) {
//               Icon icon;
//               Text text;
//
//               switch(index) {
//                 case 0:
//                   icon = Icon(Icons.add_circle, color: theme.primaryColor);
//                   text = Text('Pay via new card');
//                   break;
//                 case 1:
//                   icon = Icon(Icons.credit_card, color: theme.primaryColor);
//                   text = Text('Pay via existing card');
//                   break;
//               }
//
//               return InkWell(
//                 onTap: () {
//                   onItemPress(context, index);
//                 },
//                 child: ListTile(
//                   title: text,
//                   leading: icon,
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) => Divider(
//               color: theme.primaryColor,
//             ),
//             itemCount: 2
//         ),
//       ),
//     );
//   }
// }