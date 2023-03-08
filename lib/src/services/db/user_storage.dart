import 'package:hive/hive.dart';
import '../../models/models.dart';

class UserStorage {
  String key = 'userKey';
  Box storage = Hive.box('user');

  UserStorage.init() {
    Hive.init(null);
    Hive.openBox('user');
  }

  // Add User
  Future<void> addUser(User user) async {
    storage.put(key, user);
    storage.close();
  }

  // Add User
  dynamic getUser() => storage.get(key);

  // Update User
  Future<void> updateUser(User user) async {
    storage.put(key, user);
    storage.close();
  }

  // Delete User
  Future<void> deleteUser(User user) async {
    storage.delete(key);
    storage.close();
  }

  // Delete User
  Future<void> deleteStorage(User user) async {
    storage.deleteFromDisk();
    storage.close();
  }
}
