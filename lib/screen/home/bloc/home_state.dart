part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}


class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeLoadedSuccessState extends HomeLoadedState {}

class HomeErrorState extends HomeLoadedState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}
