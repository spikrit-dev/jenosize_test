import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:jenosize/infrastructure/source/local/models/restuarant.dart';

extension RestuarantHiveModelX on RestuarantHiveModel {
  Restuarant toEntity() => Restuarant(
        rank: rank.trim(),
        restuarant: restaurant.trim(),
        content: content.trim(),
        sales: sales.trim(),
        units: units.trim(),
        segmentCategory: segmentCategory.trim(),
        yOYSales: yOYSales.trim(),
        yOYUnits: yOYUnits.trim(),
        headquarters: headquarters.trim(),
        image: imageUrl.trim(),
      );
}
