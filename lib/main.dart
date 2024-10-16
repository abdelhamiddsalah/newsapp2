import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Helper/Cache_helper.dart';
import 'package:newsapp/Core/Styles/App-theme.dart';
import 'package:newsapp/Core/Utiels/Routes.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/PageCubit/page_cubit_cubit.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Theme_cubit/theme_cubit_cubit.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Cart_cubit/cartcubit_cubit.dart'; // استيراد CartCubit
import 'package:newsapp/Features/Home/data/Services/Get-it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  initGitIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubitCubit()),
        BlocProvider(create: (context) => CartcubitCubit()),
        BlocProvider(create: (context) => PaginationCubit()),
        BlocProvider(create: (context) => getIt<NewsCubitCubit>()),
      ],
      child: BlocBuilder<ThemeCubitCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'News App',
            theme: state is ThemeCubitLight ? Apptheme.themelight : Apptheme.themedark,
            debugShowCheckedModeBanner: false,
           routerConfig: Approutes.router,   
          );
        },
      ),
    );
  }
}
