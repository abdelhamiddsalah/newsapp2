import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/SortingDropDown.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/Home/data/Repo/RepoNews.dart';
import 'package:newsapp/Features/Home/data/Services/Api_Networking.dart';

class RevelncyView extends StatelessWidget {
  const RevelncyView({super.key, required this.item});
final String item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubitCubit(Reponews(Api_Networking(Dio())))..emitGetAllTopnewssortd(item),
      child: Revelncy(),
    );
  }
}
