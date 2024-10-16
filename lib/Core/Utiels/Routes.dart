
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/Features/Home/Presentation/Views/Home_view.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/Addtocart.dart';

abstract class Approutes {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/bookmark',
        builder: (BuildContext context, GoRouterState state) {
          return const CartView();
        },
      )
    ],
  );
}