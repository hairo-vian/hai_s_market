import 'package:hai_market/ui/home/home_viewmodel.dart';
import 'package:hai_market/ui/product_detail/product_detail_viewmodel.dart';
import 'package:hai_market/ui/products/products_viewmodel.dart';

class StateFactory<T> {
  static T? createInstanceOf<T>(Map<Type, T Function()> factories) {
    final createInstance = factories[T];

    return createInstance?.call();
  }

  static T create<T>() {
    final states = <Type, T Function()>{
      HomeState: () => HomeState() as T,
      ProductsState: () => ProductsState() as T,
      ProductDetailState: () => ProductDetailState() as T,
    };
    return createInstanceOf(states)!;
  }
}