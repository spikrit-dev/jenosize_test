import 'package:jenosize/infrastructure/source/github/models/restuarant.dart';
import 'package:jenosize/infrastructure/source/local/models/restuarant.dart';

import '../github/models/res_model.dart';

// extension GithubRestuarantModelToLocalX on GithubRestuarantModel {
//   RestuarantHiveModel toHiveModel() => RestuarantHiveModel()
//     ..rank = rank.trim()
//     ..restuarant = restuarant.trim()
//     ..content = content.trim()
//     ..sales = sales.trim()
//     ..units = units.trim()
//     ..segment = segment.trim();
// }

extension RestaurantToLocalX on Restaurant {
  RestuarantHiveModel toHiveModel() => RestuarantHiveModel()
    ..rank = rank!.trim()
    ..restaurant = restaurant!.trim()
    ..content = content!.trim()
    ..sales = sales!.trim()
    ..yOYSales = yOYSales!.trim()
    ..units = units!.trim()
    ..yOYUnits = yOYUnits!.trim()
    ..headquarters = headquarters!.trim()
    ..segmentCategory = segmentCategory!.trim()
    ..imageUrl = imageUrl!.trim();
}
