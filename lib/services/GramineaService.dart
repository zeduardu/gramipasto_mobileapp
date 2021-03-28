import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gramipasto_mobileapp/modules/graminea/models/Graminea.dart';
import 'package:http/http.dart' as http;

List<Graminea> parseGramineas(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Graminea>((json) => Graminea.fromMap(json)).toList();
}

class GramineaService {
  Future<List<Graminea>> fetchGramineas() async {
    final response = await http
        .get(Uri.parse('https://gramipasto-api.herokuapp.com/graminea/browse'));
    if (response.statusCode == 200) {
      return compute(parseGramineas, response.body);
    } else {
      throw Exception('Failed to load graminea!');
    }
  }
}
