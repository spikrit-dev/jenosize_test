// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restuarant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRestuarantModel _$GithubRestuarantModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['rank', 'restuarant'],
    disallowNullValues: const ['rank', 'restuarant'],
  );
  return GithubRestuarantModel(
    json['Rank'] as String,
    json['Restaurant'] as String,
    json['Content'] as String? ?? 'NA',
    json['Sales'] as String? ?? '',
    json['Units'] as String? ?? '',
    json['Segment_Category'] as String? ?? '',
    json['YOY_Sales'] as String? ?? '',
    json['YOY_Units'] as String? ?? '',
    json['Headquarters'] as String? ?? '',
    json['ImageUrl'] as String? ??
        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
  );
}

Map<String, dynamic> _$GithubRestuarantModelToJson(
        GithubRestuarantModel instance) =>
    <String, dynamic>{
      'Rank': instance.rank,
      'Restaurant': instance.restuarant,
      'Content': instance.content,
      'Sales': instance.sales,
      'Units': instance.units,
      'Segment_Category': instance.segment,
      'YOY_Sales': instance.yOYSales,
      'YOY_Units': instance.yOYUnits,
      'Headquarters': instance.headquarters,
      'ImageUrl': instance.imageUrl,
    };
