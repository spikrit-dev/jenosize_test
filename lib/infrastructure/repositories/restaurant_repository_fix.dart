import 'package:jenosize/infrastructure/source/mappers/github_to_local_mapper.dart';
import 'package:jenosize/infrastructure/source/mappers/local_to_entity_mapper.dart';
import '../../domain/entities/restuarant.dart';
import '../source/github/github_datasource.dart';
import '../source/local/local_datasource.dart';

abstract class RestuarantRepositoryFix {
  Future<List<Restuarant>> getAllRestuarants();

  Future<List<Restuarant>> getRestuarants({
    required int limit,
    required int page,
  });

  Future<Restuarant?> getRestuarant(String res);
}

class RestuarantDefaultRepositoryFix extends RestuarantRepositoryFix {
  RestuarantDefaultRepositoryFix({
    required this.githubDataSource,
    required this.localDataSource,
  });

  final GithubDataSource githubDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<List<Restuarant>> getAllRestuarants() async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final restuarantGithubModels = await githubDataSource.getRestaurant();
      final restuarantHiveModels =
          restuarantGithubModels!.map((e) => e.toHiveModel());
      await localDataSource.saveRestuarants(restuarantHiveModels);
    }

    final restuarantHiveModels = await localDataSource.getAllRestuarants();
    final restuarantEntities =
        restuarantHiveModels.map((e) => e.toEntity()).toList();

    return restuarantEntities;
  }

  @override
  Future<List<Restuarant>> getRestuarants(
      {required int limit, required int page}) async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final restuarantGithubModels = await githubDataSource.getRestaurant();
      final restuarantHiveModels =
          restuarantGithubModels!.map((e) => e.toHiveModel());

      await localDataSource.saveRestuarants(restuarantHiveModels);
    }

    final restuarantHiveModels = await localDataSource.getRestuarants(
      page: page,
      limit: limit,
    );
    final restuarantEntities =
        restuarantHiveModels.map((e) => e.toEntity()).toList();

    return restuarantEntities;
  }

  @override
  Future<Restuarant?> getRestuarant(String res) async {
    final restuarantModel = await localDataSource.getRestuarant(res);

    if (restuarantModel == null) return null;

    // get all evolutions
    // final evolutions = await localDataSource.getEvolutions(pokemonModel);

    // final pokemon = pokemonModel.toEntity(evolutions: evolutions);

    final restuarant = restuarantModel.toEntity();

    return restuarant;
  }
}
