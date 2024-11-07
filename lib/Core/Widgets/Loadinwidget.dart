import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
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
    await Future.delayed(Duration(milliseconds: 2000));
    
    // إخفاء التحميل بعد الانتهاء
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(); // بدون Center أو Text
  }
}
