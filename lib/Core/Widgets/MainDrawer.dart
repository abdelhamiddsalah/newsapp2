import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/Core/Widgets/Drawerheader.dart';
import 'package:newsapp/Core/Widgets/Listtilee.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Theme_cubit/theme_cubit_cubit.dart';

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
              child:const Draweheader()
              ),
              Listtilee(title: 'Home', leading: Icon(Icons.home,color: Theme.of(context).iconTheme.color,), onTap: () {
                GoRouter.of(context).go('/');
              },),
              GestureDetector(
                onTap: () {
                  //Navigator.pushReplacement(context, (context, index))
                },
                child: Listtilee(title: 'Bookmarks', leading: Icon(Icons.bookmark_border, color: Theme.of(context).iconTheme.color,), onTap: () {
                  GoRouter.of(context).push('/bookmark');
                },)),
              Listtilee(title: 'Light', leading:Icon(Icons.light, color: Theme.of(context).iconTheme.color,), 
              trailing: IconButton(onPressed: (){
          BlocProvider.of<ThemeCubitCubit>(context).toggleTheme();},  
          icon: Icon(
        BlocProvider.of<ThemeCubitCubit>(context).state is ThemeCubitDark
            ? Icons.light_mode : Icons.dark_mode,color: Theme.of(context).iconTheme.color,
      ),
        ),),
          ],
        ),
      ),
    );
  }
}


