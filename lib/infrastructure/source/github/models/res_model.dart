import 'dart:convert';

List<Restaurant> restuarantFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restuarantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  String? rank;
  String? restaurant;
  String? content;
  String? sales;
  String? yOYSales;
  String? units;
  String? yOYUnits;
  String? headquarters;
  String? segmentCategory;
  String? imageUrl;

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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        rank: json['Rank'],
        restaurant: json['Restaurant'],
        content: json['Content'] ?? "",
        sales: json['Sales'],
        yOYSales: json['YOY_Sales'],
        units: json['Units'],
        yOYUnits: json['YOY_Units'],
        headquarters: json['Headquarters'],
        segmentCategory: json['Segment_Category'],
        imageUrl: json['ImageUrl'] ??
            json[
                'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rank'] = rank;
    data['Restaurant'] = restaurant;
    data['Content'] = content;
    data['Sales'] = sales;
    data['YOY_Sales'] = yOYSales;
    data['Units'] = units;
    data['YOY_Units'] = yOYUnits;
    data['Headquarters'] = headquarters;
    data['Segment_Category'] = segmentCategory;
    data['ImageUrl'] = imageUrl;
    return data;
  }
}
