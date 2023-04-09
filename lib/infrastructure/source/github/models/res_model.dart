// List<Restaurant> restuarantFromJson(String str) =>
//     List<Restaurant>.from(json.decode(str).map((x) =>
// Restaurant.fromJson(x)));

// String restuarantToJson(List<Restaurant> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

import 'package:json_annotation/json_annotation.dart';
part 'res_model.g.dart';

@JsonSerializable()
class Restaurant {
  Restaurant({
    this.rank,
    this.restaurant,
    this.content,
    this.sales,
    this.yOYSales,
    this.units,
    this.yOYUnits,
    this.headquarters,
    this.segmentCategory,
    this.imageUrl,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  // Restaurant.fromJson(Map<String, String> json) {
  //   rank = json['Rank'];
  //   restaurant = json['Restaurant'];
  //   content = json['Content'];
  //   sales = json['Sales'];
  //   yOYSales = json['YOY_Sales'];
  //   units = json['Units'];
  //   yOYUnits = json['YOY_Units'];
  //   headquarters = json['Headquarters'];
  //   segmentCategory = json['Segment_Category'];
  //   imageUrl = json['ImageUrl'];
  // }
  @JsonKey(required: true, disallowNullValue: true)
  String? rank;
  @JsonKey(required: true, disallowNullValue: true)
  String? restaurant;
  @JsonKey(name: 'content', defaultValue: 'NA')
  String? content;
  @JsonKey(defaultValue: '0')
  String? sales;
  @JsonKey(defaultValue: '0')
  String? yOYSales;
  @JsonKey(defaultValue: '0')
  String? units;
  @JsonKey(defaultValue: '0')
  String? yOYUnits;
  @JsonKey(defaultValue: '0')
  String? headquarters;
  @JsonKey(defaultValue: '0')
  String? segmentCategory;
  @JsonKey(defaultValue: 'https://image.makewebeasy.net/noimage.png')
  String? imageUrl;

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['Rank'] = rank;
  //   data['Restaurant'] = restaurant;
  //   data['Content'] = content;
  //   data['Sales'] = sales;
  //   data['YOY_Sales'] = yOYSales;
  //   data['Units'] = units;
  //   data['YOY_Units'] = yOYUnits;
  //   data['Headquarters'] = headquarters;
  //   data['Segment_Category'] = segmentCategory;
  //   data['ImageUrl'] = imageUrl;
  //   return data;
  // }
}
