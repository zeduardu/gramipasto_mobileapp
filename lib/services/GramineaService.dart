import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';
import 'package:http/http.dart' as http;

class GramineaService {
  Future<List<Graminea>> fetchGramineas(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://localhost/graminea/browse'));
    return compute(parseGramineas, response.body);
  }

  List<Graminea> parseGramineas(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Graminea>((json) => Graminea.fromJson(json)).toList();
  }
}
