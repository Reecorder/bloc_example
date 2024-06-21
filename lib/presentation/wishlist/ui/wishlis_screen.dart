import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/utils/bike_tile.dart';

class WhisList extends StatefulWidget {
  const WhisList({super.key});

  @override
  State<WhisList> createState() => _WhisListState();
}

class _WhisListState extends State<WhisList> {
  final wishListBloc = WishlistBloc();
  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishListBloc,
      listenWhen: (previous, current) => current is WhishListActionState,
      buildWhen: (previous, current) => current is! WhishListActionState,
      listener: (context, state) {
        if (state is WishListSuccessActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is WishListItemRemoveActionnState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishListLoadinState:
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text('Wish List Screen'),
                  backgroundColor: Colors.blueAccent,
                ),
                body: const Center(child: CircularProgressIndicator()));
          case WishListSuccessState:
            final successState = state as WishListSuccessState;
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text('Wish List Screen'),
                  backgroundColor: Colors.blueAccent,
                ),
                body: ListView.builder(
                    itemCount: successState.bike.length,
                    itemBuilder: (context, index) {
                      return BikeContainer(
                        bikeModel: successState.bike[index],
                        bloc: wishListBloc,
                      );
                    }));
          case WishListFailureState:
            return const Center(child: Text('Wish List is empty'));

          default:
            return const Center(child: Text('Wish list Default'));
        }
      },
    );
  }
}
