part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  final List<Results> result;
  final int page;
  final bool hasReachedMax;
  final int count;

  const CategoryState(
      {this.result = const <Results>[],
      this.hasReachedMax = false,
      this.page = 1,
      this.count = 0});

  @override
  List<Object> get props => [result, hasReachedMax];
}

class CategoryInitState extends CategoryState {

  final CharacterModel characters;

  const CategoryInitState({required this.characters});
}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String error;

  const CategoryErrorState({required this.error});
}

