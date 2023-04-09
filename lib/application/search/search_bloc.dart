import 'package:bloc/bloc.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
import 'package:jenosize/infrastructure/repositories/restaurant_repository_fix.dart';
import 'package:jenosize/infrastructure/source/github/models/res_model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final RestuarantRepositoryFix _restuarantRepositoryFix;
  static const int restorantsPerPage = 50;
  SearchBloc(this._restuarantRepositoryFix)
      : super(const SearchState.initial()) {
    on<SearchLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }
  void _onLoadStarted(
      SearchLoadStarted event, Emitter<SearchState> emit) async {
    try {
      emit(state.asSearching());
      final resAll = event.loadAll
          ? await _restuarantRepositoryFix.getAllRestuarants()
          : await _restuarantRepositoryFix.getRestuarants(
              page: 1, limit: restorantsPerPage);

      final searched = state.restuarants
          .where((results) => results.restuarant
              .toLowerCase()
              .contains(state.input.toLowerCase()))
          .toList();
      if (event.enterInput!.isEmpty || searched.isEmpty) {
        emit(state.asSearchSuccess(resAll));
      }
      // if (searched.isEmpty || state.input.isEmpty) {
      //   emit(state.asSearchSuccess(resAll));
      // }
      emit(state.asSearchSuccess(searched));
    } on Exception catch (e) {
      emit(state.asSearchFailure(e));
    }
  }
}
