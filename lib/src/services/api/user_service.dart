import 'dart:async' show TimeoutException;
import 'dart:io' show HttpHeaders, SocketException;
import '../constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, dynamic>> getUserDetails(String token) async {
    Map<String, dynamic> body = {};
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/getdata'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(authTimeout);

      print(response.body);

      // body = jsonDecode(response.body);
      // body.addAll({'code': response.statusCode});
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return body;
  }
}
