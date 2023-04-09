import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:jenosize/infrastructure/source/local/models/restuarant.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<RestuarantHiveModel>(RestuarantHiveModelAdapter());

    await Hive.openBox<RestuarantHiveModel>(RestuarantHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final restuarantBox =
        Hive.box<RestuarantHiveModel>(RestuarantHiveModel.boxKey);

    return restuarantBox.length > 0;
  }

  Future<void> saveRestuarants(
      Iterable<RestuarantHiveModel> restaurants) async {
    final restuarantBox =
        Hive.box<RestuarantHiveModel>(RestuarantHiveModel.boxKey);

    final restuarantMap = {for (var e in restaurants) e.restaurant: e};

    await restuarantBox.clear();
    await restuarantBox.putAll(restuarantMap);
  }

  Future<List<RestuarantHiveModel>> getAllRestuarants() async {
    final restuarantBox =
        Hive.box<RestuarantHiveModel>(RestuarantHiveModel.boxKey);

    final restuarants = List.generate(
            restuarantBox.length, (index) => restuarantBox.getAt(index))
        .whereType<RestuarantHiveModel>()
        .toList();

    return restuarants;
  }

  Future<List<RestuarantHiveModel>> getRestuarants({
    required int page,
    required int limit,
  }) async {
    final restuarantBox =
        Hive.box<RestuarantHiveModel>(RestuarantHiveModel.boxKey);
    final totalrestuarants = restuarantBox.length;

    final start = (page - 1) * limit;
    final newRestuarantCount = min(totalrestuarants - start, limit);

    final restuarants = List.generate(
            newRestuarantCount, (index) => restuarantBox.getAt(start + index))
        .whereType<RestuarantHiveModel>()
        .toList();

    return restuarants;
  }

  Future<RestuarantHiveModel?> getRestuarant(String restuarant) async {
    final pokemonBox =
        Hive.box<RestuarantHiveModel>(RestuarantHiveModel.boxKey);

    return pokemonBox.get(restuarant);
  }

  // Future<List<PokemonHiveModel>> getEvolutions(PokemonHiveModel pokemon) async {
  //   final pokemonFutures =
  //       pokemon.evolutions.map((pokemonNumber) => getPokemon(pokemonNumber));

  //   final pokemons = await Future.wait(pokemonFutures);

  //   return pokemons.whereType<PokemonHiveModel>().toList();
  // }
}
