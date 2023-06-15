import 'dart:convert';
import 'package:day3/core/store.dart';
import 'package:day3/models/cart.model.dart';
import 'package:day3/models/catalog_model.dart';
import 'package:day3/widgets/add_to_cart_widget.dart';
import 'package:day3/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_detail_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://jsonkeeper.com/b/4JNQ";
  //*initialize at first during running of app
  @override
  void initState() {
    loadData();
    super.initState();
  }

  //*function to load json data2
  loadData() async {
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    //final response = await http.get(Uri.parse(url));
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData['products'];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        backgroundColor: Theme.of(context).canvasColor,

        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _, status) => FloatingActionButton(
            backgroundColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: Icon(Icons.shopping_cart),
          ).badge(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            size: 30,
            count: _cart!.items!.length,
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).canvasColor),
          ),
        ),

        body: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              //'Catalog App'.text.xl5.bold.teal600.make(),
              'Catalog App'
                  .text
                  .xl5
                  .bold
                  .color(Theme.of(context).primaryColor)
                  .make(),
              //sub heading
              //'Trendıng Products'.text.xl2.teal600.make(),
              'Trending Products'
                  .text
                  .xl3
                  .bold
                  .color(Theme.of(context).primaryColor)
                  .make(),

              // logic for items
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                //listview
                Expanded(
                  child: ListView.builder(
                      shrinkWrap:
                          true, //give space to item and element according to their size
                      itemCount: CatalogModel.items!.length,
                      itemBuilder: (context, index) {
                        var item = CatalogModel.getItemByPostion(index);
                        //item
                        return InkWell(
                          //inwell give click option
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //widget
                                  builder: (context) => HomeDetailPage(
                                        item: item,
                                      )),
                            );
                          },
                          child: VxBox(
                            child: Row(
                              children: [
                                //image
                                Hero(
                                  tag: Key('${item.id}'),
                                  //child: Image.network('${item.image}')
                                  // .box
                                  child: Image.network('${item.image}')
                                      .box
                                      .rounded
                                      .p8
                                      .color(Theme.of(context).canvasColor)
                                      //.rounded
                                      //.p8
                                      // .white
                                      .make()
                                      .p16()
                                      .h40(context)
                                      .w40(context),
                                ),
                                //column
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //item.name!.text.lg.teal600.bold.make(),
                                    item.name!.text.lg.gray600.bold
                                        .color(Theme.of(context).primaryColor)
                                        .make(),
                                    //item.desc!.text.teal500.make(),
                                    item.desc!.text.gray600
                                        .color(Theme.of(context).primaryColor)
                                        .make(),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      buttonPadding: EdgeInsets.zero,
                                      children: [
                                        '\$ ${item.price}'
                                            .text
                                            .bold
                                            .teal600
                                            .color(
                                                Theme.of(context).primaryColor)
                                            .make(),
                                        AddToCart(item: item) //list
                                      ],
                                    ).pOnly(right: 8),
                                  ],
                                ).expand(),
                              ],
                            ),
                          ).teal100.rounded.square(150).make().py16(),
                        );
                      }),
                )
              else
                Center(
                  child: LinearProgressIndicator(),
                ),
            ],
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
