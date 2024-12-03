import 'package:flutter/material.dart';
import 'package:newsapp/Features/homeFeature/data/models/TopNewsNews.dart';
import 'package:newsapp/Features/top_trending_feature/ui/widgets/image_section.dart';

class TopTrendingItem extends StatelessWidget {
  final Articles2 article;

  const TopTrendingItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // ضع هنا ما يحدث عند الضغط على المقالة
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(imageUrl: article.urlToImage ?? '', size: size),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // ضع الإجراء المناسب هنا
                  },
                  icon: Icon(
                    Icons.link,
                    color: Theme.of(context).textSelectionTheme.cursorColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
