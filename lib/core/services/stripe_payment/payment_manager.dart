import 'package:dio/dio.dart';
import 'package:ecommerce/core/services/stripe_payment/stripe_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // Handle the exception here, e.g., log the error or show an error message.
      print("Error in makePayment: $e");
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: "Adel",
            appearance: const PaymentSheetAppearance()));
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiKeys.secretKey}",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
        data: {
          "amount": amount,
          "currency": currency,
        },
      );
      return response.data["client_secret"];
    } catch (e) {
      // Handle the exception here, e.g., log the error or show an error message.
      print("Error in _getClientSecret: $e");
      throw e; // Rethrow the exception if needed.
    }
  }
}


// note ===> we should define the publishableKey in main.dart