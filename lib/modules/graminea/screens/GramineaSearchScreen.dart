import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GramineaSearchScreen extends StatefulWidget {
  @override
  _GramineaSearchScreenState createState() => _GramineaSearchScreenState();
}

class _GramineaSearchScreenState extends State<GramineaSearchScreen> {
  final formKey = GlobalKey<FormState>();
  // Recuperar o valor da pesquisa pelo dado da gramínea
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    // Zerar os dados pesquisados ou qualquer resquício de busca feita
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisar gramíneas"),
        backgroundColor: Color.fromRGBO(18, 154, 200, 1),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: searchTextController,
              onChanged: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
