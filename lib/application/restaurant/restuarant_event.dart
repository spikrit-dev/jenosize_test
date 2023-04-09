part of 'restuarant_bloc.dart';

abstract class RestuarantEvent {
  const RestuarantEvent();
}

class RestuarantLoadStarted extends RestuarantEvent {
  final bool loadAll;

  const RestuarantLoadStarted({
    this.loadAll = false,
  });
}

class RestuarantLoadMoreStarted extends RestuarantEvent {}

class RestuarantSelectChanged extends RestuarantEvent {
  final String restorantId;

  const RestuarantSelectChanged({
    required this.restorantId,
  });
}
