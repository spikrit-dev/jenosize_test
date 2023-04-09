import 'package:bloc/bloc.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../infrastructure/repositories/restaurant_repository_fix.dart';

part 'restuarant_event.dart';
part 'restuarant_state.dart';

class RestuarantBloc extends Bloc<RestuarantEvent, RestuarantState> {
  static const int restorantsPerPage = 50;
  final RestuarantRepositoryFix _restuarantRepositoryFix;

  RestuarantBloc(this._restuarantRepositoryFix)
      : super(const RestuarantState.initial()) {
    on<RestuarantLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<RestuarantLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<RestuarantSelectChanged>(_onSelectChanged);
  }

  void _onLoadStarted(
      RestuarantLoadStarted event, Emitter<RestuarantState> emit) async {
    try {
      emit(state.asLoading());

      final restuarants = event.loadAll
          ? await _restuarantRepositoryFix.getAllRestuarants()
          : await _restuarantRepositoryFix.getRestuarants(
              page: 1, limit: restorantsPerPage);

      final canLoadMore = restuarants.length >= restorantsPerPage;

      emit(state.asLoadSuccess(restuarants, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(
      RestuarantLoadMoreStarted event, Emitter<RestuarantState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());

      final restuarants = await _restuarantRepositoryFix.getRestuarants(
        page: state.page + 1,
        limit: restorantsPerPage,
      );

      final canLoadMore = restuarants.length >= restorantsPerPage;

      emit(state.asLoadMoreSuccess(restuarants, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onSelectChanged(
      RestuarantSelectChanged event, Emitter<RestuarantState> emit) async {
    try {
      final restuarantIndex = state.restuarants.indexWhere(
        (restuarant) => restuarant.restuarant == event.restorantId,
      );

      if (restuarantIndex < 0 || restuarantIndex >= state.restuarants.length) {
        return;
      }

      final restuarant =
          await _restuarantRepositoryFix.getRestuarant(event.restorantId);

      if (restuarant == null) return;

      emit(state.copyWith(
        restuarants: state.restuarants..setAll(restuarantIndex, [restuarant]),
        selecteRestuarantIndex: restuarantIndex,
      ));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }
}
