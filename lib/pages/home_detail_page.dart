import 'package:day3/models/cart.model.dart';
import 'package:day3/models/catalog_model.dart';
import 'package:day3/widgets/add_to_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_page.dart';

class HomeDetailPage extends StatefulWidget {
  HomeDetailPage({Key? key, this.item}) : super(key: key);
  final Item? item;
  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: (Theme.of(context).canvasColor),
        //backgroundColor: Vx.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          //backgroundColor: Vx.teal50,
          elevation: 0, //shadow remove
          toolbarHeight: 35,
          //title: item!.name!.text.xl3.color(Theme.of(context).primaryColor).bold.make(),
        ),
        bottomNavigationBar: ButtonBar(
          //display button on bottom
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$ ${widget.item!.price}'
                .text
                .xl3
                .bold
                .gray600
                .
                //.teal600
                color(Theme.of(context).primaryColor)
                .make(),
            AddToCart(item: widget.item).wh(100, 50),
          ],
        ).pOnly(right: 12, left: 12, top: 12, bottom: 12),
        body: Column(
          children: [
            Hero(
                //animation for changing of pics
                tag: Key('${widget.item!.id}'),
                child: Image.network(
                  '${widget.item!.image}',
                  fit: BoxFit.cover,
                )).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                child: Container(
                  width:
                      context.screenWidth, //velocity x sy a rha h ya property
                  decoration: BoxDecoration(
                    color: (Theme.of(context).cardColor),
                    //color: Colors.teal.shade100,
                  ),
                  child: Column(
                    children: [
                      45.heightBox,
                      widget.item!.name!.text.xl3
                          .color(Theme.of(context).primaryColor)
                          .bold
                          .make(),

                      widget.item!.desc!.text.xl
                          .color(Theme.of(context).primaryColor)
                          .make(),
                      //colorTheme.of(context).primaryColor),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
