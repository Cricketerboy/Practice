import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interviewproject/apimodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PersonalChat>> getAllData() async {
    const url = "https://slaychatgpt.com/api.php";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['chatList'] as List<dynamic>; // Verify the key name
        final chatList = result.map((e) {
          return PersonalChat.fromJson(e);
        }).toList();

        return chatList;
      } else {
        throw Exception(
            "Data fetch failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
      throw Exception('Data fetch failed: $e');
    }
  }
}
