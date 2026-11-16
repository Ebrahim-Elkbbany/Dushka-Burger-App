import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageService {
  static const String _guestIdKey = 'guest_id';

  Future<String?> getGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_guestIdKey);
  }

  Future<void> saveGuestId(String guestId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_guestIdKey, guestId);
  }

  Future<void> clearGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_guestIdKey);
  }
}


