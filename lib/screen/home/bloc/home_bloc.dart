import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/model/grocery_model.dart';
import 'package:bloc_app/screen/home/model/product_model.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(_onProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(_onProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(_onProductWishlistButtonNavigationEvent);
    on<HomeCartButtonNavigateEvent>(_onProductCartButtonNavigationEvent);
    
    add(HomeInitialEvent());
  }

  FutureOr<void> _onHomeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductModel.fromMap(e)).toList()));
  }

  FutureOr<void> _onProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Product Wishlist Button Clicked");
  }

  FutureOr<void> _onProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Product Cart Button Clicked");
  }

  FutureOr<void> _onProductWishlistButtonNavigationEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Product Wishlist Button Navigation");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> _onProductCartButtonNavigationEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Product Cart Button Navigation");
    emit(HomeNavigateToCartPageActionState());
  }
}
