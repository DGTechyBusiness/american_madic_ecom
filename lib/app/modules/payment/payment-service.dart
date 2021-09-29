import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String paymentId;
  String message;
  bool success;

  StripeTransactionResponse({this.message, this.success, this.paymentId});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  //Live key
  // static String secret =
  //     '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';

  static String secret =
      'sk_test_51GvVztDdoTM91tSSfpn4Dmq3ctHu7SmvDBFgmcyQFLsDMsYxWmApceYxFfW6sUdDxmseEYFF5rndFfzRowhK2pnn00j2FYU2Gs';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static init() {
    StripePayment.setOptions(StripeOptions(
        // publishableKey:
        //     "pk_live_51GvVztDdoTM91tSSpv303rf4qfnpoSyBMkWTL7b5ImaINFZw0fyopwC4XW8BW8mlRg1plKTSgFUJrkLShiQJJnXk00aOjoT3l7",
        publishableKey:
        "pk_test_51GvVztDdoTM91tSSgIusF5vLNjNH0yqgNYyrQsr9KCDka7kkwxRUiHpZzH7YlGEFgIUcCTe7qCRkBnIYAafvaYfg00eOUg1Z7z",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

/*
  static Future<StripeTransactionResponse> payViaExistingCard(
      {String amount, String currency, CreditCard card}) async {
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card)
      );
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );
      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id
          )
      );
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed',
            success: false
        );
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}',
          success: false
      );
    }
  }

 */

  static Future<StripeTransactionResponse> payWithNewCard(
      {String amount, String currency}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      var paymentIntent =
          await StripeService.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));
      if (response.status == 'succeeded') {
        print(
            'paymentmethod: ${response.paymentMethodId}\n paymentindtentid: ${response.paymentIntentId}');
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true,
            paymentId: response.paymentIntentId);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed',
            success: false,
            paymentId: response.paymentIntentId);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}',
          success: false,
          paymentId: 'Failed');
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(
        message: message, success: false, paymentId: 'Failed');
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(StripeService.paymentApiUrl,
          body: body, headers: StripeService.headers);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}
