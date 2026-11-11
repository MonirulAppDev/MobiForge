import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiforge/features/splash/data/models/health_model.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';

void main() {
  const tHealthJson = '''
  {
    "app": "Mobile Backend Lab",
    "environment": "development",
    "status": "ok",
    "time": "2026-11-11T06:41:47Z"
  }
  ''';

  test('should parse backend health check JSON into HealthModel and map to HealthEntity', () {
    final Map<String, dynamic> jsonMap = jsonDecode(tHealthJson);
    final model = HealthModel.fromJson(jsonMap);

    expect(model.app, 'Mobile Backend Lab');
    expect(model.environment, 'development');
    expect(model.status, 'ok');
    expect(model.time, '2026-11-11T06:41:47Z');

    final HealthEntity entity = model.toEntity();
    expect(entity.app, 'Mobile Backend Lab');
    expect(entity.isHealthy, true);
  });
}
