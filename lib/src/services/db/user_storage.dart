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
    await Hive.openBox('user');
    Hive.registerAdapter(UserAdapter());
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
  Future<void> deleteUser(User user) async {
    storage.delete(key);
  }

  // Delete User
  Future<void> deleteStorage(User user) async {
    storage.deleteFromDisk();
    storage.close();
  }
}
