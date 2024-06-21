import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/bike_data.dart';
import 'package:flutter_bloc_example/model/bike.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);

    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadinState());
    await Future.delayed(const Duration(seconds: 2), () {
      if (cartItemList.isEmpty) {
        emit(CartFailureState());
      } else {
        emit(CartSuccessState(bike: cartItemList));
      }
    });

    emit(CartSuccessActionState(message: "Cart successfully loaded"));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    // checking if item is exist in  cart list
    if (cartItemList.any((element) => element.id == event.id)) {
      // getting the index of the item
      int index = cartItemList.indexWhere((element) => element.id == event.id);
      // remove the item from cart list
      cartItemList.removeAt(index);
    }
    // emit => cartitemremove state
    emit(CartItemRemoveActionnState(message: "Item removed from cart"));
    // then emit cart success state
    emit(CartSuccessState(bike: cartItemList));
  }
}
