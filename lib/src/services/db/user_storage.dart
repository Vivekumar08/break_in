import 'dart:io' show Directory;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/models.dart';

class UserStorage {
  String key = 'userKey';
  Box storage = Hive.box('user');

  static Future<UserStorage> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String hivePath = directory.path;
    Hive.init(hivePath);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    await Hive.openBox('user');
    return UserStorage();
  }

  // Add User
  Future<void> addUser(User user) async {
    storage.put(key, user);
  }

  // Add User
  dynamic getUser() => storage.get(key);

  // Update User
  Future<void> updateUser(User user) async {
    storage.put(key, user);
  }

  // Delete User
  Future<void> deleteUser() async {
    storage.delete(key);
  }
}
