import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';

class GramineaStorage {
  String jsonFileName = 'gramineas.json';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<io.File> get _localFile async {
    final path = await _localPath;
    return io.File('$path/$jsonFileName');
  }

  Future<io.File> writeJson(String json) async {
    final file = await _localFile;
    return file.writeAsString('$json');
  }

  Future<String> readJson() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> exitsJsonFile() async {
    final path = await _localPath;
    var gramineasFile = io.File('$path/$jsonFileName');
    return gramineasFile.exists();
  }
}
