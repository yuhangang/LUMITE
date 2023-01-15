// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsCategory _$NewsCategoryFromJson(Map<String, dynamic> json) => NewsCategory(
      id: json['id'] as String,
      displayText: json['display_text'] as String,
      emoji: json['emoji'] as String,
      optional: json['optional'] as bool,
    );

Map<String, dynamic> _$NewsCategoryToJson(NewsCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.displayText,
      'emoji': instance.emoji,
      'optional': instance.optional,
    };
