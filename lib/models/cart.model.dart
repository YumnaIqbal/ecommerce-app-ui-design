import 'package:day3/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_model.dart';

class CartModel {
  //catalog field
  CatalogModel? _catalog = CatalogModel();

  final List<int>? _itemIds = [];

  //empty list
  // CatalogModel? get catalog => _catalog;

  //set catalog(CatalogModel? newCatalog) {
  // _catalog = newCatalog;
  //}

  List<Item>? get items =>
      _itemIds!.map((id) => _catalog!.getItemById(id)).toList(); //to make list

  //Catalogmodel list is mapping with the help of id and using the instance catalogModel
  double? get totalPrice => items!.fold(
        0, (total, current) => total! + current.price!.toDouble(),
        //fold is predefined function bydefault total =0
      );
}

class AddMutation extends VxMutation<MyStore> {
  //mystore sy inheritance ho rhi h
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds!.add(item.id!); //jason file
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds!.remove(item.id!);
  }
}
