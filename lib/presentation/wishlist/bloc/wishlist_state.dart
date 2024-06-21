part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WhishListActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishListLoadinState extends WishlistState {}

class WishListSuccessState extends WishlistState {
  final List<BikeModel> bike;
  WishListSuccessState({required this.bike});
}

class WishListFailureState extends WishlistState {}

class WishListSuccessActionState extends WhishListActionState {
  final String message;
  WishListSuccessActionState({required this.message});
}

class WishListItemRemoveActionnState extends WhishListActionState {
  final String message;
  WishListItemRemoveActionnState({required this.message});
}
