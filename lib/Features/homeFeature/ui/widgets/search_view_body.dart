import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newsapp/Core/Enums/ThemeStates.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController textcontroller= TextEditingController();
 late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      myFocusNode.unfocus();
                      Navigator.pop(context);    
                    }, icon: Icon(Icons.arrow_back_ios_new)),
                    Flexible(child: TextField(
                      focusNode: myFocusNode,
                      controller: textcontroller,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: 'Search', enabledBorder: InputBorder.none, focusedBorder: InputBorder.none,
                      suffix: IconButton(onPressed: (){textcontroller.clear();setState(() {
                        myFocusNode.unfocus();
                      });}, icon: Icon(Icons.close, color: Colors.red,)), contentPadding: EdgeInsets.only(bottom: 8/5)  ),
                    )),
                   
                  ],
                ),
              ),
              Expanded(
                child: MasonryGridView.count(
                  itemCount: searchwords.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(searchwords[index]),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}