import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/utils/bike_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  final cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartSuccessActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is CartItemRemoveActionnState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadinState:
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text('Cart Screen'),
                  backgroundColor: Colors.blueAccent,
                ),
                body: const Center(child: CircularProgressIndicator()));
          case CartSuccessState:
            final successState = state as CartSuccessState;
            return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text('Cart Screen'),
                  backgroundColor: Colors.blueAccent,
                ),
                body: ListView.builder(
                    itemCount: successState.bike.length,
                    itemBuilder: (context, index) {
                      return BikeContainer(
                        bikeModel: successState.bike[index],
                        bloc: cartBloc,
                      );
                    }));
          case CartFailureState:
            return const Center(child: Text('Cart is empty'));

          default:
            return const Center(child: Text('Cart Default'));
        }
      },
    );
  }
}
