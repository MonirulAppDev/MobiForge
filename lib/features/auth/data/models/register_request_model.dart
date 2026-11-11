import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

/// Request payload for user registration.
@freezed
abstract class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String email,
    required String password,
    @JsonKey(name: 'full_name') required String fullName,
    required String phone,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  factory RegisterRequestModel.fromEntity(RegisterParams params) =>
      RegisterRequestModel(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
        phone: params.phone,
      );
}
