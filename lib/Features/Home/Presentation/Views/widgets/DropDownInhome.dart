import 'package:flutter/material.dart';
import 'package:newsapp/Core/Utiels/Constant_colors.dart';
import 'package:newsapp/Features/Home/Presentation/Views/Revelncy_view.dart';
import 'package:newsapp/Features/Home/data/Enums/ThemeStates.dart';// Ensure this path is correct

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
          if (sortby == sortbyitem.revelancy.name) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RevelncyView(item: 'relevancy')),
            );
          }
        });
         setState(() {
          sortby = value ?? sortby;
          if (sortby == sortbyitem.popularity.name) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RevelncyView(item: 'popularity',)),
            );
          }
        });
         setState(() {
          sortby = value ?? sortby;
          if (sortby == sortbyitem.publishAt.name) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RevelncyView(item: 'publishedAt',)),
            );
          }
        });
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
      child: Text(sortbyitem.popularity.name,  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),),
    ),
    DropdownMenuItem(
      value: sortbyitem.publishAt.name,
      child: Text(sortbyitem.publishAt.name,  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),),
    ),
  ];
}
