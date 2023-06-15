import 'package:day3/models/cart.model.dart';
import 'package:day3/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel? catalog;
  CartModel? cart;

  MyStore() {
    //encapsulation
    catalog = CatalogModel();
    cart = CartModel();
  }
}
