import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/home/datasource/home_datasource.dart';
import 'package:injectable/injectable.dart';

class HomeState extends StateData {
  final List<Category>? categories;
  final List<Product>? products;

  HomeState({this.categories, this.products, ErrorModel? error}) : super(error: error);

  @override
  HomeState copyWith({List<Category>? categories, List<Product>? products, ErrorModel? error}) => HomeState(
        categories: categories ?? this.categories,
        products: products ?? this.products,
        error: error ?? this.error,
      );
}

@injectable
class HomeViewModel extends ViewModel<HomeState> {
  HomeViewModel(this._dataSource);

  final HomeDataSource _dataSource;

  void init() {
    _dataSource.getCategories().then((values) {
      List<Category> categories = [];
      for (var value in values) {
        categories.add(
          Category(value, "https://loremflickr.com/320/240/$value"),
        );
      }
      emit(state.copyWith(categories: categories));
    }).onError((error, stackTrace) {
      catchError(error, stackTrace);
    });

    _dataSource.getLatestReleasedProducts().then((value) {
      emit(state.copyWith(products: value.get()));
    }).onError((error, stackTrace) {
      catchError(error, stackTrace);
    });
  }

  bool isLoggedIn() => _dataSource.isLoggedIn;

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }
}
