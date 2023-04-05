
import 'package:hai_market/model/error/error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class StateData {
  ErrorModel? error;

  StateData({this.error});

  StateData copyWith({ErrorModel? error}) =>
      StateData(error: error ?? this.error);
}