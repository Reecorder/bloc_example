import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_example/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/utils/bike_tile.dart';
import 'package:flutter_bloc_example/presentation/wishlist/ui/wishlis_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeScreenInitialEvent());
  }

  final homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeAction,
      buildWhen: (previous, current) => current is! HomeAction,
      listener: (context, state) {
        //  Listenning the state
        if (state is HomeLikeButtonNavigationActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const WhisList()));
        } else if (state is HomeCartButtonNavigationActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Cart()));
        } else if (state is HomeLikeButtonSnackBarActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item is liked")));
        } else if (state is HomeCartButtonSnackBarActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item is Carted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          // when initial state is loading  state
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          // when initial state is success state
          case HomeSuccessState:
            final successState = state as HomeSuccessState;
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text('Home Screen'),
                  backgroundColor: Colors.blueAccent,
                  actions: [
                    IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Adding like button event to the bloc
                          homeBloc.add(HomeScreenAppBarLikeButtonClickEvent());
                        }),
                    IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined),
                        onPressed: () {
                          // Adding cart button event to the bloc
                          homeBloc.add(HomeScreenAppBarCartButtonClickEvent());
                        }),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.bike.length,
                    itemBuilder: (context, index) {
                      return BikeContainer(
                        bikeModel: successState.bike[index],
                        bloc: homeBloc,
                      );
                    }));
          // whenn error state
          case HomeErrorState:
            return const SizedBox();
          default:
            return Container();
        }
      },
    );
  }
}
