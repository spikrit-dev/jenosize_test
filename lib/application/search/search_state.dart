part of 'search_bloc.dart';

enum SearchStateStatus {
  initial,
  searching,
  searchSuccess,
  searchFailure,
  searchingMore,
  searchingMoreSuccess,
  searchingMoreFailure,
}

class SearchState {
  final SearchStateStatus status;
  final List<Restuarant> restuarants;
  final String input;
  final Exception? error;
  final int selecteRestuarantIndex;
  final int page;
  final bool canLoadMore;

  Restuarant get selecteSearchRestuarant => restuarants[selecteRestuarantIndex];

  const SearchState._({
    this.status = SearchStateStatus.initial,
    this.restuarants = const [],
    this.input = '',
    this.error,
    this.selecteRestuarantIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
  });

  const SearchState.initial() : this._();

  SearchState copyWith({
    SearchStateStatus? status,
    List<Restuarant>? restuarants,
    String? input,
    Exception? error,
    int? selecteRestuarantIndex,
    int? page,
    bool? canLoadMore,
  }) {
    return SearchState._(
      status: status ?? this.status,
      restuarants: restuarants ?? this.restuarants,
      input: input ?? this.input,
      error: error ?? this.error,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      selecteRestuarantIndex:
          selecteRestuarantIndex ?? this.selecteRestuarantIndex,
    );
  }

  SearchState asSearching() {
    return copyWith(
      status: SearchStateStatus.searching,
    );
  }

  SearchState asSearchSuccess(
    List<Restuarant> restuarants, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: SearchStateStatus.searchSuccess,
      restuarants: restuarants,
      canLoadMore: canLoadMore,
      page: 1,
    );
  }

  SearchState asSearchFailure(Exception e) {
    return copyWith(
      status: SearchStateStatus.searchFailure,
      error: e,
    );
  }

  SearchState asSearchingMore() {
    return copyWith(status: SearchStateStatus.searchingMore);
  }

  SearchState asSearchingMoreSuccess(
    List<Restuarant> newRestuarants, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: SearchStateStatus.searchingMoreSuccess,
      restuarants: [...restuarants, ...newRestuarants],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  SearchState asSearchingMoreFailure(Exception e) {
    return copyWith(
      status: SearchStateStatus.searchingMoreFailure,
      error: e,
    );
  }
}
