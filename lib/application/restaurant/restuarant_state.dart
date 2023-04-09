part of 'restuarant_bloc.dart';

enum RestuarantStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class RestuarantState {
  final RestuarantStateStatus status;
  final List<Restuarant> restuarants;
  final int selecteRestuarantIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Restuarant get selecteRestuarant => restuarants[selecteRestuarantIndex];
  const RestuarantState._({
    this.status = RestuarantStateStatus.initial,
    this.restuarants = const [],
    this.selecteRestuarantIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const RestuarantState.initial() : this._();

  RestuarantState asLoading() {
    return copyWith(
      status: RestuarantStateStatus.loading,
    );
  }

  RestuarantState asLoadSuccess(
    List<Restuarant> restuarants, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: RestuarantStateStatus.loadSuccess,
      restuarants: restuarants,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  RestuarantState asLoadFailure(Exception e) {
    return copyWith(
      status: RestuarantStateStatus.loadFailure,
      error: e,
    );
  }

  RestuarantState asLoadingMore() {
    return copyWith(status: RestuarantStateStatus.loadingMore);
  }

  RestuarantState asLoadMoreSuccess(
    List<Restuarant> newRestuarants, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: RestuarantStateStatus.loadMoreSuccess,
      restuarants: [...restuarants, ...newRestuarants],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  RestuarantState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: RestuarantStateStatus.loadMoreFailure,
      error: e,
    );
  }

  RestuarantState copyWith({
    RestuarantStateStatus? status,
    List<Restuarant>? restuarants,
    int? selecteRestuarantIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return RestuarantState._(
      status: status ?? this.status,
      restuarants: restuarants ?? this.restuarants,
      selecteRestuarantIndex:
          selecteRestuarantIndex ?? this.selecteRestuarantIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
