import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiforge/features/auth/data/models/register_response_model.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';

void main() {
  const tResponseJson = '''
  {
    "success": true,
    "message": "User registered successfully",
    "data": {
        "id": 4,
        "created_at": "2026-11-11T12:24:43.352877+06:00",
        "updated_at": "2026-11-11T12:24:43.352877+06:00",
        "email": "flutter_dev@lab.local",
        "phone": "+8801811223344",
        "full_name": "Flutter Engineer",
        "avatar_url": "",
        "role_id": 4,
        "role": {
            "id": 4,
            "created_at": "2026-11-08T12:50:52.840074+06:00",
            "updated_at": "2026-11-08T12:50:52.840074+06:00",
            "name": "User",
            "description": "Standard mobile user account"
        },
        "is_active": true,
        "language": "en",
        "timezone": "UTC",
        "country": "BD"
    },
    "meta": {
        "request_id": "67cc0772-6ce6-44a5-986c-a169af679b97",
        "timestamp": "2026-11-11T06:24:43Z"
    }
  }
  ''';

  test('should parse backend registration response JSON into RegisterResponseModel', () {
    final Map<String, dynamic> jsonMap = jsonDecode(tResponseJson);
    final responseModel = RegisterResponseModel.fromJson(jsonMap);

    expect(responseModel.success, true);
    expect(responseModel.message, 'User registered successfully');
    expect(responseModel.data.id, 4);
    expect(responseModel.data.email, 'flutter_dev@lab.local');
    expect(responseModel.data.fullName, 'Flutter Engineer');
    expect(responseModel.data.role.name, 'User');
    expect(responseModel.meta?.requestId, '67cc0772-6ce6-44a5-986c-a169af679b97');

    final UserEntity entity = responseModel.data.toEntity();
    expect(entity.id, 4);
    expect(entity.fullName, 'Flutter Engineer');
    expect(entity.role.name, 'User');
    expect(entity.country, 'BD');
  });
}
