import 'dart:convert';

import 'login.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<dynamic> _get(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<List<dynamic>> getUserList() async {
    return await _get('${Urls.BASE_URL}/users');
  }

  static Future<List<dynamic>> getNewsList() async {
    return await _get('${Urls.BASE_URL}/types/3/news');
  }

  static Future<List<dynamic>> getAwardsList() async {
    return await _get('${Urls.BASE_URL}/awards');
  }

  static Future<dynamic> getAward(int awardId) async {
    return await _get('${Urls.BASE_URL}/awards/$awardId');
  }

  static Future<List<dynamic>> getCommitteeList() async {
    return await _get('${Urls.BASE_URL}/committees');
  }

  static Future<dynamic> getCommittee(int committeId) async {
    return await _get('${Urls.BASE_URL}/committees/$committeId');
  }

  static Future<dynamic> getPost(int postId) async {
    return await _get('${Urls.BASE_URL}/types/3/news/$postId');
  }

  static Future<dynamic> getCommentsForPost(int postId) async {
    return await _get('${Urls.BASE_URL}/posts/$postId/comments');
  }
}
