import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/ui/login/datasource/login_datasource.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../model/error/error_model.dart';
import '../../model/state_data/state_data.dart';

class LoginState extends StateData {
  final bool isLoading;
  final bool? loginSuccess;
  final String errorMessage;

  LoginState({this.isLoading = false, this.loginSuccess = false, this.errorMessage = "", ErrorModel? error})
      : super(error: error);

  @override
  LoginState copyWith({bool? isLoading, bool? loginSuccess, String? errorMessage, ErrorModel? error}) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        loginSuccess: loginSuccess ?? this.loginSuccess,
        errorMessage: errorMessage ?? this.errorMessage,
        error: error ?? this.error,
      );
}

@injectable
class LoginViewModel extends ViewModel<LoginState> {
  LoginViewModel(this._dataSource);

  final LoginDataSource _dataSource;

  void login(String email, String password) {
    if (email.isEmpty) {
      emit(state.copyWith(errorMessage: "Please fill email"));
      return;
    }
    if (!email.isValidEmail) {
      emit(state.copyWith(errorMessage: "Invalid email input"));
      return;
    }
    if (password.isEmpty) {
      emit(state.copyWith(errorMessage: "Please fill password"));
      return;
    }

    emit(state.copyWith(isLoading: true));
    _dataSource.login(email, password).then((value) {
      emit(state.copyWith(isLoading: false, loginSuccess: true));
    }).onError((error, stackTrace) {
      emit(state.copyWith(isLoading: false, loginSuccess: false));
      catchError(error, stackTrace);
    });
  }

  String get username => _dataSource.username;

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    print(change);
  }
}
