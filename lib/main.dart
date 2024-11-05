import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsapp/Core/routes/app_routes.dart';
import 'package:newsapp/Core/routes/routes.dart';
import 'package:newsapp/Core/di/get-it.dart';
import 'package:newsapp/Core/styles/App-theme.dart';
import 'package:newsapp/Features/homeFeature/data/models/articleAdapter.dart';
import 'package:newsapp/Features/homeFeature/data/models/cartitrmAdapter.dart';
import 'package:newsapp/Features/homeFeature/logic/theme_cubit/theme_cubit_cubit.dart';
import 'package:newsapp/Features/detailsFeature/logic/Cart_cubit/cartcubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
 Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>('cartBox');
  await Hive.openBox('settingsBox');
  initGitIt(); // Ensure this function registers required services in GetIt
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubitCubit>()),
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
            onGenerateRoute: AppRouting().generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
