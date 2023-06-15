import 'package:day3/core/store.dart';
import 'package:day3/models/cart.model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  //final _cart = CartModel(); //object or instane of class

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        //backgroundColor: Vx.white,
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          //backgroundColor: Vx.white,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          toolbarHeight: 35,
          //title: 'Cart'.text.teal600.make(),
          title:
              'Cart'.text.xl4.color(Theme.of(context).primaryColor).bold.make(),
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
              //vx used for specific changing
              builder: (context, _, status) {
                return '\$${_cart!.totalPrice}' //total ko bss specific show krna h when item remove total update
                    .text
                    .xl5
                    .color(Theme.of(context).primaryColor)
                    .make();
              },

              mutations: {RemoveMutation},
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: 'Payment Services not Supported'.text.make()),
                );
              },
              child: 'Pay'.text.make(),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ).wh(100, 50),
          ],
        ),
        body: Column(
          children: [
            _CardList().p32().expand(),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 0.5,
            ),
          ],
        ));
  }
}

class _CardList extends StatelessWidget {
  _CardList({Key? key}) : super(key: key);

  //final _cart = CartModel(); //instance of cartmodel
  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]); //cart pr remove
    return _cart!.items!.isEmpty
        ? "Cart is Empty"
            .text
            .xl3
            .color(Theme.of(context).primaryColor)
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items![index]);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items![index].name!.text.make(),
              );
            },
          );
  }
}
