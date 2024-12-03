// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() async {
    EasyLoading.show(status: 'Loading...');
    
    // قم بتنفيذ مهامك هنا
    await Future.delayed(const Duration(milliseconds: 2000));
    
    // إخفاء التحميل بعد الانتهاء
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(); // بدون Center أو Text
  }
}
