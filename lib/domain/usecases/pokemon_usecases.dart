import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:jenosize/infrastructure/repositories/restaurant_repository_fix.dart';
import 'package:jenosize/infrastructure/repositories/restuarant_repository.dart';

import '../../core/usecase.dart';

class GetAllRestuarantsUseCase extends NoParamsUseCase<List<Restuarant>> {
  // const GetAllRestuarantsUseCase(this.repository);
  const GetAllRestuarantsUseCase(this.repositoryFix);

  // final RestuarantRepository repository;
  final RestuarantRepositoryFix repositoryFix;

  @override
  Future<List<Restuarant>> call() {
    return repositoryFix.getAllRestuarants();
  }
}

class GetRestuarantsParams {
  const GetRestuarantsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}

class GetRestuarantsUseCase
    extends UseCase<List<Restuarant>, GetRestuarantsParams> {
  const GetRestuarantsUseCase(this.repositoryFix);

  final RestuarantRepositoryFix repositoryFix;

  @override
  Future<List<Restuarant>> call(GetRestuarantsParams params) {
    return repositoryFix.getRestuarants(page: params.page, limit: params.limit);
  }
}

class GetRestuarantParams {
  final String res;

  const GetRestuarantParams(this.res);
}

class GetPokemonUseCase extends UseCase<Restuarant?, GetRestuarantParams> {
  final RestuarantRepositoryFix repositoryFix;

  const GetPokemonUseCase(this.repositoryFix);

  @override
  Future<Restuarant?> call(GetRestuarantParams params) {
    return repositoryFix.getRestuarant(params.res);
  }
}
