import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/products/datasource/products_datasource.dart';
import 'package:injectable/injectable.dart';

class ProductsState extends StateData {
  List<Product>? products = [];
  final int skipLength;
  final bool allItemFetched;

  ProductsState({this.products, this.skipLength = 0, this.allItemFetched = false, ErrorModel? error})
      : super(error: error);

  @override
  ProductsState copyWith({List<Product>? products, int? skipLength, bool? allItemFetched, ErrorModel? error}) =>
      ProductsState(
        products: products ?? this.products,
        skipLength: skipLength ?? this.skipLength,
        allItemFetched: allItemFetched ?? this.allItemFetched,
        error: error ?? this.error,
      );
}

@injectable
class ProductsViewModel extends ViewModel<ProductsState> {
  ProductsViewModel(this._dataSource);

  final ProductsDataSource _dataSource;

  void getProductList(String? categoryName, String? searchKeyword) {
    _dataSource.getProducts(categoryName, searchKeyword, state.skipLength, 30).then((value) {
      List<Product> fetchedProducts = state.products ?? [];
      fetchedProducts.addAll(value.get()!);
      emit(state.copyWith(
        products: fetchedProducts,
        allItemFetched: fetchedProducts.length >= value.total!,
      ));
    }).onError((error, stackTrace) {
      catchError(error, stackTrace);
    });
  }

  void searchProducts(String? categoryName, String? keyword) {
    emit(state.copyWith(products: []));
    getProductList(categoryName, keyword);
  }

  void fetchNextPage(String? categoryName, String? searchKeyword) {
    if (!state.allItemFetched) {
      emit(state.copyWith(skipLength: state.skipLength + 30));
      getProductList(categoryName, searchKeyword);
    }
  }

  @override
  void onChange(Change<ProductsState> change) {
    super.onChange(change);
    print(change);
  }
}
