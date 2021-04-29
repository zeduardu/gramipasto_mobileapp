import 'package:flutter/cupertino.dart';
import 'package:gramipasto_mobileapp/models/Graminea.dart';
import 'package:gramipasto_mobileapp/services/GramineaService.dart';
import 'package:gramipasto_mobileapp/utils/app_state.dart';

class GramineaController {
  final stateNotifier = ValueNotifier<AppState>(AppState.empty);
  final repository = GramineaService();
  List<Graminea>? gramineas;
  String? messageError;

  set state(AppState state) => stateNotifier.value = state;
  AppState get state => stateNotifier.value;

  set error(String error) => messageError = error;
  String get error => messageError!;

  void getGramineas() async {
    state = AppState.loading;
    try {
      gramineas = await repository.fetchGramineas();
    } catch (e) {
      error = e.toString();
      state = AppState.error;
    }
    state = AppState.success;
  }

  List<Graminea> getGramineasBySearchTerm(String commonName) {
    return gramineas!.where((element) => element.nomeComum.toLowerCase().contains(commonName)).toList();
  }

  void upateGramineaListFile() {
    repository.updateJsonFile();
  }
}
