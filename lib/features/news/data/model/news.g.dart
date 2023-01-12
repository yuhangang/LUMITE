// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      newsTitle: json['news_title'] as String,
      publisherName: json['publisher_name'] as String,
      imageUrl: json['image_url'] as String,
      publisherImageUrl: json['publisher_image_url'] as String,
      publisherRectangleUrl: json['publisher_rectangle_url'] as String,
      updated: json['updated'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'news_title': instance.newsTitle,
      'publisher_name': instance.publisherName,
      'image_url': instance.imageUrl,
      'publisher_image_url': instance.publisherImageUrl,
      'publisher_rectangle_url': instance.publisherRectangleUrl,
      'updated': instance.updated,
      'link': instance.link,
    };
