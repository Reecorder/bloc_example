import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/bike_data.dart';
import 'package:flutter_bloc_example/model/bike.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // Initial Home screen event
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
    // App bar like button clickd event and its associated functionality
    on<HomeScreenAppBarLikeButtonClickEvent>(
        homeScreenAppBarLikeButtonClickEvent);

    // App bar cart button clickd event and its associated functionality
    on<HomeScreenAppBarCartButtonClickEvent>(
        homeScreenAppBarCartButtonClickEvent);

    // Home screen product like button clickd event and its associated functionality
    on<HomeScreenLikeButtonClickEvent>(homeScreenLikeButtonClickEvent);

    // Home screen product cart button clickd event and its associated functionality
    on<HomeScreenCartButtonClickEvent>(homeScreenCartButtonClickEvent);
  }

  // Initial event fuction
  FutureOr<void> homeScreenInitialEvent(
      HomeScreenInitialEvent event, Emitter<HomeState> emit) async {
    // emitting Intitial loading state
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeSuccessState(
        bike: BikeData.bikes.map((e) => BikeModel.fromJson(e)).toList()));
  }

// Home Screen App Bar Like Button Click Event  Function For navigation
  FutureOr<void> homeScreenAppBarLikeButtonClickEvent(
      HomeScreenAppBarLikeButtonClickEvent event, Emitter<HomeState> emit) {
    log("Like Button Navigate Click");
    //emitting state corresponding to the event
    emit(HomeLikeButtonNavigationActionState());
  }

// Home Screen App Bar Cart Button Click Event  Function For navigation
  FutureOr<void> homeScreenAppBarCartButtonClickEvent(
      HomeScreenAppBarCartButtonClickEvent event, Emitter<HomeState> emit) {
    log("Cart Button Navigate Click");
    //emitting state corresponding to the event
    emit(HomeCartButtonNavigationActionState());
  }

// Home screen product like button clicked
  FutureOr<void> homeScreenLikeButtonClickEvent(
      HomeScreenLikeButtonClickEvent event, Emitter<HomeState> emit) {
    log("Like button Clicked");
    //emitting state corresponding to the event
    likedItemList.add(event.bike);
    emit(HomeLikeButtonSnackBarActionState());
  }

  // Home screen product cart button clicked
  FutureOr<void> homeScreenCartButtonClickEvent(
      HomeScreenCartButtonClickEvent event, Emitter<HomeState> emit) {
    //
    log("Cart button Clicked");
    cartItemList.add(event.bike);
    emit(HomeCartButtonSnackBarActionState());
  }
}
