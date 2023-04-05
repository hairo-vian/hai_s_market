import 'package:hai_market/di/dependency_injection.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:injectable/injectable.dart';

abstract class ViewModelFactory {
  T create<T extends ViewModel>();
}

@Singleton(as: ViewModelFactory)
class ViewModelFactoryImpl implements ViewModelFactory {
  @override
  T create<T extends ViewModel>() => getIt.get<T>();
}
