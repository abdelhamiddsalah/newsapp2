import 'package:json_annotation/json_annotation.dart';
part 'TopNewsNews.g.dart';
@JsonSerializable()
class TopNews {
  String? status;
  int? totalResults;
  List<Articles2>? articles;

  TopNews({this.status, this.totalResults, this.articles});

   factory TopNews.fromJson(Map<String, dynamic> json) => _$TopNewsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TopNewsToJson(this);
}
@JsonSerializable()
class Articles2 {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles2(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

   factory Articles2.fromJson(Map<String, dynamic> json) => _$Articles2FromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$Articles2ToJson(this);
}
@JsonSerializable()
class Source {
  String? id;
  String? name;

  Source({this.id, this.name});
 
   factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}