// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['Rank', 'Restaurant'],
    disallowNullValues: const ['Rank', 'Restaurant'],
  );
  return Restaurant(
    rank: json['Rank'] as String?,
    restaurant: json['Restaurant'] as String?,
    content: json['Content'] as String? ?? 'NA',
    sales: json['Sales'] as String? ?? '0',
    yOYSales: json['YOY_Sales'] as String? ?? '0',
    units: json['Units'] as String? ?? '0',
    yOYUnits: json['YOY_Units'] as String? ?? '0',
    headquarters: json['Headquarters'] as String? ?? '0',
    segmentCategory: json['Segment_Category'] as String? ?? '0',
    imageUrl: json['ImageUrl'] as String? ??
        'https://image.makewebeasy.net/noimage.png',
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rank', instance.rank);
  writeNotNull('Restaurant', instance.restaurant);
  val['Content'] = instance.content;
  val['Sales'] = instance.sales;
  val['YOY_Sales'] = instance.yOYSales;
  val['Units'] = instance.units;
  val['YOY_Units'] = instance.yOYUnits;
  val['Headquarters'] = instance.headquarters;
  val['Segment_Category'] = instance.segmentCategory;
  val['ImageUrl'] = instance.imageUrl;
  return val;
}
