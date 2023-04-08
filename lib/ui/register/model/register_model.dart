import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hai_market/model/json_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterRequest implements JSONModel {
  String? name;
  String? email;
  String? password;
  String? avatar;

  RegisterRequest({this.name, this.email, this.password, this.avatar});

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  factory RegisterRequest.fromJson(dynamic json) => _$RegisterRequestFromJson(json);
}
