import 'package:flutter/material.dart';
import 'package:newsapp/Core/Widgets/MainDrawer.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Features/Home/Presentation/Views/TopTrending_view.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/AppbarInhome.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/DropDownInhome.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/ListviewArticlesInHome.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/PaesNumbersInhome.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/TitelsInHome.dart';
import 'package:newsapp/Features/Home/data/Enums/ThemeStates.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}
class _HomeViewBodyState extends State<HomeViewBody> {
  var enumswords = newsapp.Allnews;
  @override
  void initState() {
    super.initState();
  }
  void _changeNewsType(newsapp newsType) {
    setState(() {
      enumswords = newsType;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Appbarwidget(),
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _changeNewsType(newsapp.Allnews),
                    child: TitelsInHome(
                      title: 'All News',
                      color: enumswords == newsapp.Allnews
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      fontsize: enumswords == newsapp.Allnews ? 18 : 14,
                    ),
                  ),
                const  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _changeNewsType(newsapp.TopTrending),
                    child: TitelsInHome(
                      title: 'Top Trending',
                      color: enumswords == newsapp.TopTrending
                          ? Theme.of(context).cardColor: Colors.transparent,
                      fontsize: enumswords == newsapp.TopTrending ? 18 : 14,
                    ),
                  ),
                ],
              ),
             const Verticalspacing(height: 15),
              enumswords == newsapp.TopTrending
                  ? Container(): PaginationWidget(),
               const  Verticalspacing(height: 10),
                enumswords==newsapp.TopTrending?Container():  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Dropdowninhome(),
                    )),
                  const  Verticalspacing(height: 10),
                   if(enumswords == newsapp.Allnews)
                 const  ListViewArticlesInHome(),
                   if(enumswords==newsapp.TopTrending)
                const   ToptrendingView()
            ],
          ),
        ),
      ),
    );
  }
}
