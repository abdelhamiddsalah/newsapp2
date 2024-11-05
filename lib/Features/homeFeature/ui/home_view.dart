import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/Home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginationCubit(),
      child: const HomeViewBody(),
    );
  }
}
