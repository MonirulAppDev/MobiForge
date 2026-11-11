import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/auth/data/models/user_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

/// Top-level API response envelope for `/auth/register`.
@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    required bool success,
    required String message,
    required UserModel data,
    AuthMetaModel? meta,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

/// Metadata payload containing tracking and timestamp details.
@freezed
abstract class AuthMetaModel with _$AuthMetaModel {
  const factory AuthMetaModel({
    @JsonKey(name: 'request_id') String? requestId,
    String? timestamp,
  }) = _AuthMetaModel;

  factory AuthMetaModel.fromJson(Map<String, dynamic> json) =>
      _$AuthMetaModelFromJson(json);
}
