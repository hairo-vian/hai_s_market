import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/ui/register/datasource/register_datasource.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../model/error/error_model.dart';
import '../../model/state_data/state_data.dart';

class RegisterState extends StateData {
  final bool registerSuccess;
  final bool isLoading;
  final String errorMessage;

  RegisterState({
    this.registerSuccess = false,
    this.isLoading = false,
    this.errorMessage = "",
    ErrorModel? error,
  }) : super(error: error);

  @override
  RegisterState copyWith({bool? registerSuccess, bool? isLoading, String? errorMessage, ErrorModel? error}) =>
      RegisterState(
        registerSuccess: registerSuccess ?? this.registerSuccess,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        error: error ?? this.error,
      );
}

@injectable
class RegisterViewModel extends ViewModel<RegisterState> {
  RegisterViewModel(this._dataSource);

  final RegisterDataSource _dataSource;

  void createUser(String email, String name, String password) {
    if (email.isEmpty) {
      emit(state.copyWith(errorMessage: "Please fill email"));
      return;
    }

    if (!email.isValidEmail) {
      emit(state.copyWith(errorMessage: "Invalid email input"));
      return;
    }

    if (name.isEmpty) {
      emit(state.copyWith(errorMessage: "Please fill name"));
      return;
    }

    if (password.isEmpty) {
      emit(state.copyWith(errorMessage: "Please fill password"));
      return;
    }

    emit(state.copyWith(isLoading: true));
    _dataSource.createUser(email, name, password).then((value) {
      emit(state.copyWith(registerSuccess: true, isLoading: false));
    }).onError((error, stackTrace) {
      emit(state.copyWith(registerSuccess: false, isLoading: false));
      catchError(error, stackTrace);
    });
  }

  @override
  void onChange(Change<RegisterState> change) {
    super.onChange(change);
    print(change);
  }
}
