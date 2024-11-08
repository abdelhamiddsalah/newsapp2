// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Utiels/Constant_colors.dart';
import 'package:newsapp/Core/enums/theme_states.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';

class Dropdowninhome extends StatefulWidget {
  const Dropdowninhome({super.key});

  @override
  State<Dropdowninhome> createState() => _DropdowninhomeState();
}

class _DropdowninhomeState extends State<Dropdowninhome> {
  var sortby = sortbyitem.publishAt.name;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: sortby,
      dropdownColor: darkBackgroundColor,
      items: dropDownItems(context),
      onChanged: (String? value) {
        setState(() {
          sortby = value ?? sortby;
        });

        if (sortby == sortbyitem.revelancy.name) {
          context.read<NewsCubitCubit>().emitGetAllTopnewssortd('relevancy');
        } else if (sortby == sortbyitem.popularity.name) {
          context.read<NewsCubitCubit>().emitGetAllTopnewssortd('popularity');
        } else if (sortby == sortbyitem.publishAt.name) {
          context.read<NewsCubitCubit>().emitGetAllTopnewssortd('publishedAt');
        }
      },
    );
  }
}

List<DropdownMenuItem<String>> dropDownItems(BuildContext context) {
  return [
    DropdownMenuItem(
      value: sortbyitem.revelancy.name,
      child: Text(
        sortbyitem.revelancy.name,
        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
      ),
    ),
    DropdownMenuItem(
      value: sortbyitem.popularity.name,
      child: Text(
        sortbyitem.popularity.name,
        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
      ),
    ),
    DropdownMenuItem(
      value: sortbyitem.publishAt.name,
      child: Text(
        sortbyitem.publishAt.name,
        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
      ),
    ),
  ];
}
