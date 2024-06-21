part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartLoadinState extends CartState {}

class CartSuccessState extends CartState {
  final List<BikeModel> bike;
  CartSuccessState({required this.bike});
}

class CartFailureState extends CartState {}

class CartSuccessActionState extends CartActionState {
  final String message;
  CartSuccessActionState({required this.message});
}

class CartItemRemoveActionnState extends CartActionState {
  final String message;
  CartItemRemoveActionnState({required this.message});
}
