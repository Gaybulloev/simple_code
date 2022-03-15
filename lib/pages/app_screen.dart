import 'package:flutter/material.dart';
import 'package:simple_code/cubit/theme_cubit.dart';
import 'package:simple_code/data/category_repository.dart';
import 'package:simple_code/pages/user_screen.dart';
import '../category_bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'card_section.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final ScrollController controller = ScrollController();

  final _scrollController = ScrollController();

  static int page = 1;

  @override
  void initState() {
    context.read<CategoryBloc>().add(CategoryLoadEvent(page: page));
    _scrollController.addListener(() {
      _onScroll();
    });
    super.initState();
  }

  void _onScroll() {
    if (_isBottom) {
      setState(() {
        page++;
        context.read<CategoryBloc>().add(CategoryLoadEvent(page: page));
      });
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.read<ThemeCubit>().changeTheme(!ThemeCubit.darkTheme),
          icon: const Icon(Icons.nightlight_round),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CategoryInitState) {
              print(CategoryRepository.characters.length);
              return ListView.builder(
                itemCount: CategoryRepository.characters.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => UserScreen(
                        image: CategoryRepository.characters[index].image,
                        name: CategoryRepository.characters[index].name,
                        location: CategoryRepository.characters[index].location.name,
                        originLocation: CategoryRepository.characters[index].origin.name,
                        gender: CategoryRepository.characters[index].gender,
                      )));
                    },
                    child: CardSection(
                      gender: CategoryRepository.characters[index].gender,
                      image: CategoryRepository.characters[index].image,
                      text: CategoryRepository.characters[index].name,
                      subText: CategoryRepository.characters[index].name,
                    ),
                  );
                },
              );
            }else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
