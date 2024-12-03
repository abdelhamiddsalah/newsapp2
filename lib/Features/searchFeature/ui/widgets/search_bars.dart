import 'package:flutter/material.dart';

class SearchBars extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;

  const SearchBars({
    super.key,
    required this.textController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              focusNode.unfocus();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          Flexible(
            child: TextField(
              focusNode: focusNode,
              controller: textController,
              autofocus: true,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffix: IconButton(
                  onPressed: () {
                    textController.clear();
                    focusNode.unfocus();
                  },
                  icon: const Icon(Icons.close, color: Colors.red),
                ),
                contentPadding: const EdgeInsets.only(bottom: 8 / 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
