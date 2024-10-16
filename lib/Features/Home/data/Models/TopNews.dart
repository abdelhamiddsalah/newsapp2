import 'package:json_annotation/json_annotation.dart';
part 'TopNews.g.dart';
@JsonSerializable()
class TopNews {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  TopNews({this.status, this.totalResults, this.articles});

  factory TopNews.fromJson(Map<String, dynamic> json) => _$TopNewsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TopNewsToJson(this);
}
@JsonSerializable()
class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

      factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
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