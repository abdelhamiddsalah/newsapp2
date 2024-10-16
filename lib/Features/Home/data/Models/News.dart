import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

@JsonSerializable()
class News {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  News({this.status, this.totalResults, this.articles});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsToJson(this);
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