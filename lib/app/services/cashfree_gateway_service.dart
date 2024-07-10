import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:get/get.dart';

import '../../common/color_pallete.dart';

class CashfreePG {
  static late CashfreePG? _instance = null;

  CashfreePG get getInstance {
    _instance ??= CashfreePG();
    return _instance!;
  }

  CashfreePG() {
    cfPaymentGatewayService.setCallback(_verifyPayment, _onError);
  }

  var cfPaymentGatewayService = CFPaymentGatewayService();

  void _onError(CFErrorResponse errorResponse, String orderId) {
    log(errorResponse.getMessage().toString());
    log("Error while making payment");
  }

  makePayment(
      {required String phoneNumber,
      required String amount,
      required Function(bool) onSuccess,
      required Function(CFErrorResponse, String) onError}) async {
    try {
      await createSession(phoneNumber, amount).then((session) {
        var theme = CFThemeBuilder()
            .setNavigationBarBackgroundColorColor("#303493")
            .setNavigationBarTextColor("#ffffff")
            .build();
        var cfWebCheckout = CFWebCheckoutPaymentBuilder()
            .setSession(session!)
            .setTheme(theme)
            .build();
        cfPaymentGatewayService.setCallback((orderId) async {
          await _verifyPayment(orderId).then((value) {
            if (!value) {
              const GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: Duration(seconds: 3),
                message: "Payment was not successful !",
              );
            }
            onSuccess(value);
          });
        }, onError);
        cfPaymentGatewayService.doPayment(cfWebCheckout);
      });
    } on CFException catch (e) {
      onError(CFErrorResponse("401", e.message, "code", "type"), "");
    }
  }

  final CASHFREE_CREATE_ORDER_URL =
      "https://cashfree.digitalji.in/cashfree/order";

  Future<CFSession?> createSession(String phoneNumber, String amount) async {
    Dio dio = Dio();
    try {
      return await dio.post(CASHFREE_CREATE_ORDER_URL,
          data: {"amount": amount, "phone_number": phoneNumber}).then((value) {
        if (value.statusCode == 200) {
          try {
            var oid = value.data["order_id"];
            var spi = value.data["payment_session_id"];
            var session = CFSessionBuilder()
                .setEnvironment(CFEnvironment.PRODUCTION)
                .setOrderId(oid)
                .setPaymentSessionId(spi)
                .build();
            return session;
          } on CFException catch (e) {
            print(e.message);
          }
        }
        return null;
      });
    } on DioError catch (ex) {
      print(ex.message);
    }
    return null;
  }

  final CASHFREE_VERIFY_PAYMENT_URL =
      "https://cashfree.digitalji.in/cashfree/verify";

  Future<bool> _verifyPayment(String orderId) async {
    Dio dio = Dio();
    try {
      return await dio
          .get("$CASHFREE_VERIFY_PAYMENT_URL/$orderId")
          .then((value) {
        if (value.statusCode == 200) {
          return value.data["status"];
        }
        return false;
      });
    } on DioError catch (ex) {
      print(ex.message);
    }
    return false;
  }
}
