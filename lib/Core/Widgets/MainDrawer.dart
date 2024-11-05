import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/Drawerheader.dart';
import 'package:newsapp/Core/Widgets/Listtilee.dart';
import 'package:newsapp/Core/enums/ThemeStates.dart';
import 'package:newsapp/Core/routes/routes.dart';
import 'package:newsapp/Features/homeFeature/logic/theme_cubit/theme_cubit_cubit.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Draweheader(),
            ),
            Listtilee(
              title: 'Home',
              leading: Icon(
                Icons.home,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.homeView);
              },
            ),
            Listtilee(
              title: 'Bookmarks',
              leading: Icon(
                Icons.bookmark_border,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.bookMarkView);
              },
            ),
            Listtilee(
              title: 'Theme',
              leading: Icon(
                Icons.light,
                color: Theme.of(context).iconTheme.color,
              ),
              trailing: IconButton(
                onPressed: () {
                  // Toggle between light and dark themes
                  final currentThemeState = BlocProvider.of<ThemeCubitCubit>(context).state;
                  final newTheme = currentThemeState is ThemeCubitDark
                      ? Themestates.Light
                      : Themestates.Dark;
                  BlocProvider.of<ThemeCubitCubit>(context).toggleTheme(newTheme);
                },
                icon: Icon(
                  BlocProvider.of<ThemeCubitCubit>(context).state is ThemeCubitDark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
