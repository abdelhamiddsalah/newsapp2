// ignore: file_names
import 'package:flutter/material.dart';
import 'package:newsapp/Core/widgets/recording_time.dart';
import 'package:newsapp/Core/widgets/vertical_spacing.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/imageInHomeInlistview.dart';
import 'package:newsapp/Core/widgets/row_in_home_in_listview.dart';

// ignore: camel_case_types
class cardInHomeList extends StatelessWidget {
  const cardInHomeList({
    super.key,
    required this.article,
  });

  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              padding:const EdgeInsets.all(10),
              margin:const EdgeInsets.all(10),
              child: Row(
                children: [
                  imageInHomeInlistview(article: article),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title ?? 'No title available',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const verticalspacing(height: 6),
                        const  RecordingTime(),
                        const verticalspacing(height: 6),
                        const RowInListViewInHome(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
