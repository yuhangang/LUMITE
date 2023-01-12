// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsCategory _$NewsCategoryFromJson(Map<String, dynamic> json) => NewsCategory(
      id: json['id'] as String,
      displayText: json['display_text'] as String,
      optional: json['optional'] as bool? ?? true,
    );

Map<String, dynamic> _$NewsCategoryToJson(NewsCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.displayText,
      'optional': instance.optional,
    };
