import 'package:talker_flutter/talker_flutter.dart';

/// Centralized Application Logger and Diagnostics Tool.
///
/// Captures HTTP requests, Bloc state changes, errors, and provides
/// an interactive in-app debug screen (`TalkerScreen`) for QA and dev.
class AppTalker {
  AppTalker._();

  static final Talker instance = TalkerFlutter.init(
    settings: TalkerSettings(
      maxHistoryItems: 1000,
      useConsoleLogs: true,
    ),
  );
}
