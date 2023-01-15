import "package:json_annotation/json_annotation.dart";

part "news_category.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsCategory {
  final String id;
  final String displayText;
  final String emoji;
  final bool optional;

  const NewsCategory({
    required this.id,
    required this.displayText,
    required this.emoji,
    this.optional = true,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) =>
      _$NewsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCategoryToJson(this);
}
