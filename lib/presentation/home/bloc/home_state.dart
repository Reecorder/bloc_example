part of 'home_bloc.dart';

// Home screen state handler for ui buolding
@immutable
sealed class HomeState {}

// Home action  state handler for performing actions in home screen
abstract class HomeAction extends HomeState {}

// Intial state handler
final class HomeInitial extends HomeState {}

// Home screen loading state
class HomeLoadingState extends HomeState {}

// Home screen success state
class HomeSuccessState extends HomeState {
  // When success state is emitted it will return the list of bike model
  final List<BikeModel> bike;

  // constructor
  HomeSuccessState({required this.bike});
}

// Home screen error state
class HomeErrorState extends HomeState {}

// Home screen like button navigation action
class HomeLikeButtonNavigationActionState extends HomeAction {}

// Home screen cart button navigation action
class HomeCartButtonNavigationActionState extends HomeAction {}

// Home screen like button snackbar action
class HomeLikeButtonSnackBarActionState extends HomeAction {}

// Home screen cart button snackbar action
class HomeCartButtonSnackBarActionState extends HomeAction {}
