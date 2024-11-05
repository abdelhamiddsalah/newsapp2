import 'package:dio/dio.dart';
import 'package:newsapp/Features/homeFeature/data/models/TopNewsNews.dart';

import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

import 'package:retrofit/http.dart';

part 'Api_Networking.g.dart';

@RestApi(baseUrl:'https://newsapi.org/v2/')
abstract class Api_Networking {
  factory Api_Networking(Dio dio, {String? baseUrl}) = _Api_Networking;

  @GET('everything?apiKey=1ecaa419f24e4b28a9f446ddb0fc77a7&q=bitcoin')
  Future<News> getNews();

@GET('everything?apiKey=1ecaa419f24e4b28a9f446ddb0fc77a7&q=bitcoin')
  Future<News> getNewsSortby(
    @Query("sortBy") String sortBy,
  );

  @GET('everything?apiKey=1ecaa419f24e4b28a9f446ddb0fc77a7&q=bitcoin')
  Future<News> getNewsSortbypage(
    @Query('page') int page,
  );

  @GET('top-headlines?country=us&apiKey=1ecaa419f24e4b28a9f446ddb0fc77a7')
  Future<TopNews> getTopNews();
}
