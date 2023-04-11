import 'package:hive/hive.dart';

class UserRepository {
  Box get _userBox => Hive.box("user");

  Future<void> createUser() async {
    _userBox.put("user_created", true);
  }

  Future<bool> userExists() async {
    final isCreated = _userBox.get("user_created");
    if (isCreated == null) {
      return false;
    }
    return isCreated;
  }
}
