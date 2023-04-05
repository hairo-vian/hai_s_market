import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/products/datasource/products_datasource.dart';
import 'package:injectable/injectable.dart';

class ProductsState extends StateData {
  final List<Product>? products;

  ProductsState({this.products, ErrorModel? error}) : super(error: error);

  @override
  ProductsState copyWith({List<Product>? products, ErrorModel? error}) => ProductsState(
        products: products ?? this.products,
        error: error ?? this.error,
      );
}

@injectable
class ProductsViewModel extends ViewModel<ProductsState> {
  ProductsViewModel(this._dataSource);

  final ProductsDataSource _dataSource;

  void getProductsList(String? categoryName) {
    _dataSource.getProducts(categoryName).then((value) {
      emit(state.copyWith(products: value.get()));
    }).onError((error, stackTrace) {
      catchError(error, stackTrace);
    });
  }

  @override
  void onChange(Change<ProductsState> change) {
    super.onChange(change);
    print(change);
  }
}
