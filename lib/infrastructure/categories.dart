import '../configs/colors.dart';
import '../domain/entities/category.dart';
import '../route.dart';

const List<Category> categories = [
  Category(
    name: 'ค้นหาร้านอาหาร',
    color: AppColors.red,
    route: Routes.search,
  ),
  Category(
    name: 'แผนที่ บริษัท Jenosize',
    color: AppColors.teal,
    route: Routes.maps,
  ),
  // Category(name: 'Abilities', color: AppColors.blue, route: Routes.pokedex),
  // Category(name: 'Items', color: AppColors.yellow, route: Routes.items),
  // Category(name: 'Locations', color: AppColors.purple, route: Routes.pokedex),
  // Category(name: 'Type Effects', color: AppColors.brown, route: Routes.typeEffects),
];
