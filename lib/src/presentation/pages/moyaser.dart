import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moyasar/moyasar.dart';

class MoyaserPayment extends StatefulWidget {
  final dynamic onPaymentResult;
  final dynamic paymentConfig;

  const MoyaserPayment(
      {super.key, required this.onPaymentResult, required this.paymentConfig});

  @override
  State<MoyaserPayment> createState() =>
      _MoyaserPaymentState(paymentConfig, onPaymentResult);
}

class _MoyaserPaymentState extends State<MoyaserPayment> {
  final dynamic paymentConfig;
  final dynamic onPaymentResult;

  _MoyaserPaymentState(this.paymentConfig, this.onPaymentResult);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           CreditCard(
  //             config: paymentConfig,
  //             onPaymentResult: onPaymentResult,
  //             locale: Localization.ar(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Payment with Card",
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (Platform.isIOS)
                    ? ApplePay(
                        config: paymentConfig,
                        onPaymentResult: onPaymentResult,
                      )
                    : Container(),
                (Platform.isIOS)
                    ? SizedBox(
                        height: 15.h,
                      )
                    : Container(),
                CreditCard(
                  config: paymentConfig,
                  onPaymentResult: onPaymentResult,
                  locale: const Localization.ar(),
                ),
              ],
            ),
          ),
        ));
  }
}
