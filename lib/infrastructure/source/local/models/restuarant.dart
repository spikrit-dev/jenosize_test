import 'package:hive/hive.dart';

part 'restuarant.g.dart';

@HiveType(typeId: 1)
class RestuarantHiveModel extends HiveObject {
  static const String boxKey = 'restuarant';

  @HiveField(0)
  late String rank;

  @HiveField(1)
  late String restaurant;

  @HiveField(2)
  late String content;

  @HiveField(3)
  late String sales;

  @HiveField(4)
  late String units;

  @HiveField(5)
  late String segmentCategory;

  @HiveField(6)
  late String imageUrl;

  @HiveField(7)
  late String yOYSales;

  @HiveField(8)
  late String yOYUnits;

  @HiveField(9)
  late String headquarters;
}
