class ErrorModel {
  String? code;
  String? message;

  ErrorModel({this.code, this.message});

  factory ErrorModel.unresolvedError() => ErrorModel(
      code: "500",
      message:
          "Server Error, Please Contact Your Developer To Resolve This Error");
}
