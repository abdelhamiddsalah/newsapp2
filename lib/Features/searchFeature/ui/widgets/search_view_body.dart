import 'package:flutter/material.dart';
import 'search_bars.dart';
import 'search_results.dart';
class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController textController;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    textController.dispose();
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
              SearchBars(
                textController: textController,
                focusNode: myFocusNode,
              ),
              Expanded(child: SearchResults()),
            ],
          ),
        ),
      ),
    );
  }
}
