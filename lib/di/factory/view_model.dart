import 'dart:async';

import 'package:hai_market/di/factory/instances_factory.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/util/error_handler.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum Event { ERROR }

abstract class ViewModel<T extends StateData> extends Cubit<T> {
  ViewModel() : super(StateFactory.create<T>());

  final _event = StreamController<Event>();

  StreamController<Event> get event => _event;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    catchError(error, stackTrace);
  }

  void catchError(Object? error, dynamic stackTrace) {
    (error is DioError) ? _onDioError(error) : _onUnresolvableError(error);
    _event.add(Event.ERROR);
    print(stackTrace);
  }

  void _onDioError(DioError e) {
    emit(state.copyWith(error: ErrorHandler.dioErrorHandler(e)) as T);
  }

  void _onUnresolvableError(Object? e) {
    emit(state.copyWith(error: ErrorModel.unresolvedError()) as T);
  }
}
