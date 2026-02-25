import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static void init(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static const String _sessionsKey = 'total_sessions';
  static const String _minutesKey = 'total_minutes';

  static int get totalSessions => _prefs.getInt(_sessionsKey) ?? 0;
  static int get totalMinutes => _prefs.getInt(_minutesKey) ?? 0;

  static Future<void> addSession(int minutes) async {
    final currentSessions = totalSessions;
    final currentMinutes = totalMinutes;

    await _prefs.setInt(_sessionsKey, currentSessions + 1);
    await _prefs.setInt(_minutesKey, currentMinutes + minutes);
  }
}
