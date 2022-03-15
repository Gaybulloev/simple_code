import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../data/category_repository.dart';
import '../data/model/character_model.dart';


part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc(this.categoryRepository) : super(CategoryLoadingState()) {
    on<CategoryLoadEvent>((event, emit) async {

      try {
        final products = await categoryRepository.getData(page: event.page);
        CategoryRepository.characters.addAll(products.results);
        emit(CategoryInitState(characters: products));

      } catch (e, stacktrace) {
        print(stacktrace);
        emit(CategoryErrorState(error: e.toString()));
      }
    });

  }
}

