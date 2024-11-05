import 'package:hive/hive.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

class ArticlesAdapter extends TypeAdapter<Articles> {
  @override
  final int typeId = 1; // يجب أن يكون معرفًا فريدًا لهذا النوع

  @override
  Articles read(BinaryReader reader) {
    return Articles(
      author: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
      url: reader.readString(),
      urlToImage: reader.readString(),
      publishedAt: reader.readString(),
      content: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Articles obj) {
    writer.writeString(obj.author ?? '');
    writer.writeString(obj.title ?? '');
    writer.writeString(obj.description ?? '');
    writer.writeString(obj.url ?? '');
    writer.writeString(obj.urlToImage ?? '');
    writer.writeString(obj.publishedAt ?? '');
    writer.writeString(obj.content ?? '');
  }
}
