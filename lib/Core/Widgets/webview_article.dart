import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Services/Api_Networking.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';
import 'package:newsapp/Features/homeFeature/data/repos/Repo/RepoNews.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewDetails extends StatefulWidget {
  final Articles article; // Pass the article itself

  const WebviewDetails({Key? key, required this.article}) : super(key: key);

  @override
  State<WebviewDetails> createState() => _WebviewDetailsState();
}
class _WebviewDetailsState extends State<WebviewDetails> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubitCubit(Reponews(Api_Networking(Dio()))),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
            builder: (context, state) {
              final url = widget.article.url;

              if (url == null || url.isEmpty) {
                return const Center(child: Text('No link available'));
              }
              _controller.loadRequest(Uri.parse(url));
              return WebViewWidget(controller: _controller);
            },
          ),
        ),
      ),
    );
  }
}
