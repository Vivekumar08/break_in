import 'package:flutter/foundation.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/db/db.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  User get user => _user;

  UserProvider.init() {
    dynamic userStored = locator.get<UserStorage>().getUser();
    if (userStored is User) {
      _user = userStored;
    }
  }
}
