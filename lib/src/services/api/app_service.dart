import 'dart:async' show TimeoutException;
import 'dart:convert' show jsonDecode;
import 'dart:io' show HttpHeaders, SocketException;
import '../constants.dart';
import 'package:http/http.dart' as http;

class AppService {
  Future<List<dynamic>> hotspots(String token, double lat, double lng) async {
    List<dynamic> body = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$dataUrl/NearestHotspot?lat=$lat&lng=$lng'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: token,
        },
      );

      print(response.body);
      body = jsonDecode(response.body);
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return body;
  }

  Future<Map<String, dynamic>> filterSearch(
      String token, double lat, double lng, String category) async {
    Map<String, dynamic> body = {};
    try {
      http.Response response = await http.get(
        Uri.parse('$dataUrl/filterSearch?lat=$lat&lng=$lng&cat=$category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: token,
        },
      );

      body = jsonDecode(response.body);
      body.addAll({'code': response.statusCode});
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return body;
  }

  Future<Map<String, dynamic>> foodPlace(
      String token, String foodPlaceId) async {
    Map<String, dynamic> body = {};
    try {
      http.Response response = await http.get(
        Uri.parse('$dataUrl/foodPlace?foodPlaceId=$foodPlaceId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: token,
        },
      );

      body = jsonDecode(response.body);
      body.addAll({'code': response.statusCode});
    } on TimeoutException catch (_) {
      timeOut();
    } on SocketException catch (_) {
      noInternet();
    } catch (e) {
      throw Exception(e);
    }
    return body;
  }

  Future<Map<String, dynamic>> search(String token, String query) async {
    Map<String, dynamic> body = {};
    try {
      http.Response response = await http.get(
        Uri.parse('$dataUrl//Search?word=$query'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: token,
        },
      );

      body = jsonDecode(response.body);
      body.addAll({'code': response.statusCode});
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
