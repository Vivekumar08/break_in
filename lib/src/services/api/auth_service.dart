import 'dart:async' show TimeoutException;
import 'dart:convert' show jsonEncode, jsonDecode;
import 'dart:io' show SocketException;
import '../../models/models.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<User?> loginWithMail(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/user/loginWithEmail'),
        body: jsonEncode({"Email": email, "Password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(timeout);

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return User.fromJson(body['UserLogin']);
      }
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<User?> registerWithMail(
      String name, String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/user/registerWithEmail'),
        body: jsonEncode(
            {"FullName": name, "Email": email, "Password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(timeout);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return User.fromJson(body);
      }
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
