part of 'home_bloc.dart';

// Home screen event handler
@immutable
sealed class HomeEvent {}

// Home screen initial event
class HomeScreenInitialEvent extends HomeEvent {}

// Home screen like button click event
class HomeScreenLikeButtonClickEvent extends HomeEvent {
  final BikeModel bike;

  HomeScreenLikeButtonClickEvent({required this.bike});
}

// Home screen cart button click event
class HomeScreenCartButtonClickEvent extends HomeEvent {
  final BikeModel bike;

  HomeScreenCartButtonClickEvent({required this.bike});
}

// Home screen app bar like buttton click for navigation
class HomeScreenAppBarLikeButtonClickEvent extends HomeEvent {}

// Home screen app bar cart buttton click for navigation
class HomeScreenAppBarCartButtonClickEvent extends HomeEvent {}
