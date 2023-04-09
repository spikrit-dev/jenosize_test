part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchLoadStarted extends SearchEvent {
  final bool loadAll;
  final String? enterInput;

  const SearchLoadStarted({
    this.loadAll = false,
    this.enterInput,
  });
}

class SearchLoadMoreStarted extends SearchEvent {}

class SearchSelectChanged extends SearchEvent {
  final String searchId;

  const SearchSelectChanged({
    required this.searchId,
  });
}
