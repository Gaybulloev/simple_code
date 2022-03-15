part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object> get props => [];
}

class CategoryLoadEvent extends CategoryEvent {

  final int page;

  const CategoryLoadEvent({required this.page});
}
