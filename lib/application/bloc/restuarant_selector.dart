import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/application/bloc/restuarant_bloc.dart';
import 'package:jenosize/domain/entities/restuarant.dart';
// import 'package:pokedex/domain/entities/pokemon.dart';
// import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
// import 'package:pokedex/states/pokemon/pokemon_state.dart';

class RestuarantStateSelector<T>
    extends BlocSelector<RestuarantBloc, RestuarantState, T> {
  RestuarantStateSelector({
    super.key,
    required T Function(RestuarantState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class RestuarantStateStatusSelector
    extends RestuarantStateSelector<RestuarantStateStatus> {
  RestuarantStateStatusSelector(Widget Function(RestuarantStateStatus) builder,
      {super.key})
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class RestuarantCanLoadMoreSelector extends RestuarantStateSelector<bool> {
  RestuarantCanLoadMoreSelector(Widget Function(bool) builder, {super.key})
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfRestuarantsSelector extends RestuarantStateSelector<int> {
  NumberOfRestuarantsSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.restuarants.length,
          builder: builder,
        );
}

class CurrentRestuarantSelector extends RestuarantStateSelector<Restuarant> {
  CurrentRestuarantSelector(Widget Function(Restuarant) builder, {super.key})
      : super(
          selector: (state) => state.selecteRestuarant,
          builder: builder,
        );
}

class RestuarantSelector
    extends RestuarantStateSelector<RestuarantSelectorState> {
  RestuarantSelector(int index, Widget Function(Restuarant, bool) builder,
      {super.key})
      : super(
          selector: (state) => RestuarantSelectorState(
            state.restuarants[index],
            state.selecteRestuarantIndex == index,
          ),
          builder: (value) => builder(value.restuarant, value.selected),
        );
}

class RestuarantSelectorState {
  final Restuarant restuarant;
  final bool selected;

  const RestuarantSelectorState(this.restuarant, this.selected);

  @override
  bool operator ==(Object other) =>
      other is RestuarantSelectorState &&
      restuarant == other.restuarant &&
      selected == other.selected;
}
