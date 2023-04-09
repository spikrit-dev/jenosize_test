class Restuarant {
  const Restuarant({
    required this.rank,
    required this.restuarant,
    required this.content,
    required this.sales,
    required this.units,
    required this.segmentCategory,
    required this.yOYSales,
    required this.yOYUnits,
    required this.headquarters,
    required this.image,
  });

  final String rank;
  final String restuarant;
  final String content;
  final String sales;
  final String units;
  final String segmentCategory;
  final String yOYSales;
  final String yOYUnits;
  final String headquarters;
  final String image;
}

// extension RestuarantX on Restuarant {
//   Color get color => rank.first.color;

//   Map<PokemonTypes, double> get typeEffectiveness {
//     final effectiveness = PokemonTypes.values
//         .where((element) => element != PokemonTypes.unknown)
//         .map(
//           (type) => MapEntry(
//             type,
//             types
//                 .map((pokemonType) => pokemonType.effectiveness[type] ?? 1.0)
//                 .reduce((total, effectiveness) => total * effectiveness),
//           ),
//         );

//     return Map.fromEntries(effectiveness);
//   }
// }
