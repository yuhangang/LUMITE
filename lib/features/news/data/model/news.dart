import "package:json_annotation/json_annotation.dart";

part "news.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class News {
  final String newsTitle;
  final String publisherName;
  final String imageUrl;
  final String publisherImageUrl;
  final String publisherRectangleUrl;
  final String updated;
  final String link;

  News(
      {required this.newsTitle,
      required this.publisherName,
      required this.imageUrl,
      required this.publisherImageUrl,
      required this.publisherRectangleUrl,
      required this.updated,
      required this.link});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
