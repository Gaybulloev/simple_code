
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  static bool darkTheme = false;

  void changeTheme(bool value) => emit(darkTheme = value);

}