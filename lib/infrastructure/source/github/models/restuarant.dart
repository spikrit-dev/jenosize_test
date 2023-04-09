import 'package:json_annotation/json_annotation.dart';
part 'restuarant.g.dart';

@JsonSerializable()
class GithubRestuarantModel {
  GithubRestuarantModel(
    this.rank,
    this.restuarant,
    this.content,
    this.sales,
    this.units,
    this.segment,
    this.yOYSales,
    this.yOYUnits,
    this.headquarters,
    this.imageUrl,
  );

  @JsonKey(required: true, disallowNullValue: true)
  final String rank;
  @JsonKey(required: true, disallowNullValue: true)
  final String restuarant;
  @JsonKey(name: 'content', defaultValue: 'NA')
  final String content;
  @JsonKey(defaultValue: '')
  final String sales;
  @JsonKey(defaultValue: '')
  final String units;
  @JsonKey(defaultValue: '')
  final String segment;
  @JsonKey(defaultValue: '')
  final String yOYSales;
  @JsonKey(defaultValue: '')
  final String yOYUnits;
  @JsonKey(defaultValue: '')
  final String headquarters;
  @JsonKey(defaultValue: defaultImg)
  final String imageUrl;

  factory GithubRestuarantModel.fromJson(Map<String, dynamic> json) =>
      _$GithubRestuarantModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRestuarantModelToJson(this);
}

const String defaultImg =
    'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg';
