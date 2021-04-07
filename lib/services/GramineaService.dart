import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:gramipasto_mobileapp/modules/graminea/models/Graminea.dart';
import 'package:gramipasto_mobileapp/utils/GramineaStorage.dart';

List<Graminea> parseGramineas(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Graminea>((json) => Graminea.fromMap(json)).toList();
}

class GramineaService {
  final gramineaStorage = GramineaStorage();

  Future<void> updateJsonFile() async {
    final response = await http
        .get(Uri.parse('https://gramipasto-api.herokuapp.com/graminea/browse'));
    if (response.statusCode == 200) {
      gramineaStorage.writeJson(response.body);
    } else {
      throw Exception('Falha ao carregar os dados da API.');
    }
  }

  Future<List<Graminea>> fetchGramineas() async {
    gramineaStorage.exitsJsonFile().then((value) => {
          if (value)
            {
              gramineaStorage
                  .readJson()
                  .then((value) => {compute(parseGramineas, value)})
            }
          else
            {updateJsonFile()}
        });

    final response = await http
        .get(Uri.parse('https://gramipasto-api.herokuapp.com/graminea/browse'));
    if (response.statusCode == 200) {
      return compute(parseGramineas, response.body);
    } else {
      throw Exception('Failed to load graminea!');
    }
  }

  // Acrônimo BREAD (Browse, Read, Edit, Add, Delete)
  Future<List<String>> browseGraminea() async {

    return null;
  }

}
