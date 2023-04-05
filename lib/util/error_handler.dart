import 'package:hai_market/model/error/error_model.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static ErrorModel? dioErrorHandler(DioError e) {
    ErrorModel? error;
    switch (e.type) {
      case DioErrorType.connectTimeout:
        error = ErrorModel(code: ErrorCode.dioConnectionTimeOut, message: ErrorMessage.connectionError);
        break;
      case DioErrorType.sendTimeout:
        error = ErrorModel(code: ErrorCode.dioSendTimeOut, message: ErrorMessage.connectionError);
        break;
      case DioErrorType.receiveTimeout:
        error = ErrorModel(code: ErrorCode.dioReceiveTimeOut, message: ErrorMessage.connectionError);
        break;
      case DioErrorType.response:
        error = ErrorModel(
          code: e.response?.statusCode.toString() ?? ErrorCode.dioXMLHttpRequestError,
          message: e.response?.statusMessage ?? ErrorMessage.contactDeveloper,
        );
        break;
      case DioErrorType.cancel:
        error = ErrorModel(code: ErrorCode.dioConnectionCancel, message: ErrorMessage.processHarmed);
        break;
      case DioErrorType.other:
        error = ErrorModel(code: ErrorCode.dioDefaultError, message: ErrorMessage.contactDeveloper);
        break;
    }
    return error;
  }
}

class ErrorCode {
  static const String dioConnectionTimeOut = "EDE01";
  static const String dioSendTimeOut = "EDE02";
  static const String dioReceiveTimeOut = "EDE03";
  static const String dioResposeError = "EDE04";
  static const String dioConnectionCancel = "EDE05";
  static const String dioDefaultError = "EDE06";
  static const String dioXMLHttpRequestError = "EDE07";
}

class ErrorMessage {
  static const String connectionError = "Connection Error, Please Check Your Connection Stability";
  static const String contactDeveloper = "Please Contact The Developer To Resolve This Error";
  static const String processHarmed = "Process Harmed, Please Don't Take Unnecessary Action While Process Is Yet Completed";
}
