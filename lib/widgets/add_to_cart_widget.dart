import 'package:day3/core/store.dart';
import 'package:day3/models/cart.model.dart';
import 'package:day3/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, this.item}) : super(key: key);
  final Item? item; //variable

  @override
  Widget build(BuildContext context) {
    //rebuild when state change
    //change when the state is change

    final CartModel? _cart = (VxState.store as MyStore)
        .cart; //instance of cart model and assign value
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    //done add or remove
    bool isInCart = _cart!.items!.contains(item);

    return ElevatedButton(
      onPressed: () {
        //_cart.catalogModel=_catalog;
        if (!isInCart) {
          AddMutation(item!);
        }
      },
      child: isInCart ? Icon(Icons.done) : 'Add'.text.make(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }
}
