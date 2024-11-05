import 'package:bloc_app/screen/cart/ui/cart.dart';
import 'package:bloc_app/screen/home/bloc/home_bloc.dart';
import 'package:bloc_app/screen/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistScreen()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case const (HomeLoadedSuccessState):
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  final product = (state).products[index];
                  return ListTile(
                    title: Text(product.name),
                  );
                },
                itemCount: (state as HomeLoadedSuccessState).products.length,
              ),
            );
          case const (HomeErrorState):
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return const Scaffold(
              body: Center(
                child: Text('Unknown State'),
              ),
            );
        }
      },
    );
  }
}
