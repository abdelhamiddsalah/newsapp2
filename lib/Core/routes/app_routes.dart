import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/Core/routes/routes.dart';
import 'package:newsapp/features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/features/detailsFeature/ui/details_view.dart';
import 'package:newsapp/features/cartFeature/ui/add_to_bookmarks.dart';
import 'package:newsapp/features/homeFeature/data/models/mainnews.dart';
import 'package:newsapp/features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/features/homeFeature/ui/home_view.dart';

class AppRouting {
  final GetIt getIt = GetIt.instance;

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NewsCubitCubit>()..emitGetAllUsers(),
            child: const HomeView(),
          ),
        );
      case Routes.bookMarkView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: const CartView(),
          ),
        );
      case Routes.detailView:
        final article = settings.arguments as Articles; // استخراج المقال
        return MaterialPageRoute(
          builder: (_) => 
             BlocProvider(
              create: (context) => CartCubit(),
              child: DetailsView(article: article),
            ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Page not found")),
            body: const Center(child: Text("404 - Page not found")),
          ),
        );
    }
  }
}
