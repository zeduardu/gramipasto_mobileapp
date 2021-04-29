import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';
import 'package:gramipasto_mobileapp/utils/graminea_storage.dart';
import 'package:http/http.dart' as http;

List<Graminea> parseGramineas(String responseBody) {
  var respondeBodyUtf8 = utf8.decode(responseBody.codeUnits);
  final parsed = jsonDecode(respondeBodyUtf8).cast<Map<String, dynamic>>();
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
    var existFile = await gramineaStorage.exitsJsonFile();

    if (existFile) {
      gramineaStorage
          .readJson()
          .then((value) => {compute(parseGramineas, value)});
    } else {
      updateJsonFile();
    }

    final response = await http
        .get(Uri.parse('https://gramipasto-api.herokuapp.com/graminea/browse'));
    if (response.statusCode == 200) {
      return compute(parseGramineas, response.body);
    } else {
      throw Exception('Failed to load graminea!');
    }
  }

  // Acrônimo BREAD (Browse, Read, Edit, Add, Delete)
  List<Graminea> browseGramineasByFilter(
      List<Graminea> data, String searchTerm) {
    return data
        .where(
            (element) => element.nomeComum.toLowerCase().contains(searchTerm))
        .toList();
  }
}
