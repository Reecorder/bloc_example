import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_example/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/model/bike.dart';
import 'package:flutter_bloc_example/presentation/wishlist/bloc/wishlist_bloc.dart';

class BikeContainer extends StatelessWidget {
  final BikeModel bikeModel;
  final Bloc bloc;

  const BikeContainer({
    required this.bikeModel,
    required this.bloc,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 10, 28, 42), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(bikeModel.imageUrl.toString(),
              height: 200.0, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bikeModel.name.toString(),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        bloc is WishlistBloc
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: bloc is WishlistBloc ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        if (bloc is HomeBloc) {
                          // adding home screen like button event
                          bloc.add(
                              HomeScreenLikeButtonClickEvent(bike: bikeModel));
                        } else if (bloc is WishlistBloc) {
                          // remove from cart event
                          bloc.add(RemoveFromWishListEvent(
                              id: int.parse(bikeModel.id.toString())));
                        }
                      }),
                  IconButton(
                      icon: Icon(bloc is CartBloc
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined),
                      onPressed: () {
                        if (bloc is HomeBloc) {
                          // adding home screen cart button event
                          bloc.add(
                              HomeScreenCartButtonClickEvent(bike: bikeModel));
                        } else if (bloc is CartBloc) {
                          // remove from cart event
                          bloc.add(RemoveFromCartEvent(
                              id: int.parse(bikeModel.id.toString())));
                        }
                      }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(bikeModel.description.toString()),
          const SizedBox(height: 5.0),
          Text(
            '\$${bikeModel.price!.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
