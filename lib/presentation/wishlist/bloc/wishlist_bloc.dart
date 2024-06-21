import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/bike_data.dart';
import 'package:flutter_bloc_example/model/bike.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<RemoveFromWishListEvent>(removeFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishListLoadinState());
    await Future.delayed(const Duration(seconds: 2), () {
      if (likedItemList.isEmpty) {
        emit(WishListFailureState());
      } else {
        emit(WishListSuccessState(bike: likedItemList));
      }
    });

    emit(WishListSuccessActionState(message: "Wish list successfully loaded"));
  }

  FutureOr<void> removeFromWishListEvent(
      RemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    // checking if item is exist in  wish list
    if (likedItemList.any((element) => element.id == event.id)) {
      // getting the index of the item
      int index = likedItemList.indexWhere((element) => element.id == event.id);
      // remove the item from wish list
      likedItemList.removeAt(index);
    }
    // emit => wish list item remove state
    emit(
        WishListItemRemoveActionnState(message: "Item removed from wish list"));
    // then emit wish list success state
    emit(WishListSuccessState(bike: likedItemList));
  }
}
