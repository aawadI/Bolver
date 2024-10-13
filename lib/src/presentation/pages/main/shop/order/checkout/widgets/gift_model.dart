import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/components/components.dart';

import '../riverpod/notifier/checkout_notifier.dart';

class GiftModal extends StatefulWidget {
  final CheckoutNotifier notifier;

  GiftModal({required this.notifier});

  @override
  _GiftModalState createState() => _GiftModalState();
}

class _GiftModalState extends State<GiftModal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.h,
      padding: EdgeInsets.all(15.w),
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: fromController,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  hintText: 'من',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب عليك كتابه اسم المرسل";
                  }
                  return null;
                },
              ),
              SizedBox(height: 7.h,),
              TextFormField(
                controller: toController,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  hintText: 'الي',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب عليك كتابه اسم المرسل اليه";
                  }
                  return null;
                },
              ),
              SizedBox(height: 7.h,),
              TextFormField(
                controller: msgController,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  hintText: 'الرساله',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب عليك كتابه محتوي الرساله";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h,),
              AccentLoginButton(title: 'حفظ', onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.notifier.setTo(toController.text);
                  widget.notifier.setFrom(fromController.text);
                  widget.notifier.setMessage(msgController.text);
                  Navigator.pop(context);
                }
              },),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       widget.notifier.setTo(toController.text);
              //       widget.notifier.setFrom(fromController.text);
              //       widget.notifier.setMessage(msgController.text);
              //       Navigator.pop(context);
              //     }
              //   },
              //   child: Text('Submit'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}