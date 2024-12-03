// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newsapp/Core/routes/app_routes.dart';
import 'package:newsapp/Core/routes/routes.dart';
import 'package:newsapp/Core/styles/app_theme.dart';
import 'package:newsapp/Features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/theme_cubit/theme_cubit_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubitCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: BlocBuilder<ThemeCubitCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'News App',
            theme: state is ThemeCubitLight
                ? Apptheme.themedark
                : Apptheme.themelight,
            initialRoute: Routes.homeView,
            builder: EasyLoading.init(),
            onGenerateRoute: AppRouting().generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
