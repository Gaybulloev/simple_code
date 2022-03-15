import 'package:flutter/material.dart';
import 'package:simple_code/cubit/theme_cubit.dart';
import 'package:simple_code/pages/app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_bloc/category_bloc.dart';
import 'data/category_repository.dart';


void main()  {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

   @override
  State<App> createState() => _AppState();
  static _AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state ? ThemeData.light() : ThemeData.dark(),
            home: const  AppScreen(),
          );
        }
      ),
    );
  }
}
