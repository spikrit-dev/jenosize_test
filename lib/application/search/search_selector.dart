import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/application/search/search_bloc.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
// import 'package:pokedex/domain/entities/pokemon.dart';
// import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
// import 'package:pokedex/states/pokemon/pokemon_state.dart';

class SearchStateSelector<T> extends BlocSelector<SearchBloc, SearchState, T> {
  SearchStateSelector({
    super.key,
    required T Function(SearchState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class SearchStateStatusSelector extends SearchStateSelector<SearchStateStatus> {
  SearchStateStatusSelector(Widget Function(SearchStateStatus) builder,
      {super.key})
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class RestuarantCanSearchingMoreSelector extends SearchStateSelector<bool> {
  RestuarantCanSearchingMoreSelector(Widget Function(bool) builder, {super.key})
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfRestuarantsSearchSelector extends SearchStateSelector<int> {
  NumberOfRestuarantsSearchSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.restuarants.length,
          builder: builder,
        );
}

class CurrentRestuarantSearchSelector extends SearchStateSelector<Restuarant> {
  CurrentRestuarantSearchSelector(Widget Function(Restuarant) builder,
      {super.key})
      : super(
          selector: (state) => state.selecteSearchRestuarant,
          builder: builder,
        );
}

class RestuarantSearchSelector
    extends SearchStateSelector<RestuarantSearchSelectorState> {
  RestuarantSearchSelector(int index, Widget Function(Restuarant, bool) builder,
      {super.key})
      : super(
          selector: (state) => RestuarantSearchSelectorState(
            state.restuarants[index],
            state.selecteRestuarantIndex == index,
          ),
          builder: (value) => builder(value.restuarant, value.selected),
        );
}

class RestuarantSearchSelectorState {
  final Restuarant restuarant;
  final bool selected;

  const RestuarantSearchSelectorState(this.restuarant, this.selected);

  @override
  bool operator ==(Object other) =>
      other is RestuarantSearchSelectorState &&
      restuarant == other.restuarant &&
      selected == other.selected;
}
