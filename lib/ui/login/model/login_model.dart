import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hai_market/model/json_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginResponse implements JSONModel {
  String access_token;

  LoginResponse(this.access_token);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(dynamic json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class ProfileResponse implements JSONModel {
  int id;
  String email;
  String name;

  ProfileResponse(this.id, this.email, this.name);

  @override
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  factory ProfileResponse.fromJson(dynamic json) => _$ProfileResponseFromJson(json);
}
