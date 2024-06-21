part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class RemoveFromWishListEvent extends WishlistEvent {
  final int id;
  RemoveFromWishListEvent({required this.id});
}
