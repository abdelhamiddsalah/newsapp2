import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/core/di/get_it.dart';
import 'package:newsapp/Features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/data/models/article_adapter.dart';
import 'package:newsapp/Features/homeFeature/data/models/cartitrm_adapter.dart';
import 'package:newsapp/newsApp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>('cartBox');
  await Hive.openBox('settingsBox');
  await initGitIt(); 
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
