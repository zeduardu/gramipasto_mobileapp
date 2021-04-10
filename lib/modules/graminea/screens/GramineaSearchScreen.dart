import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GramineaSearchScreen extends StatefulWidget {
  @override
  _GramineaSearchScreenState createState() => _GramineaSearchScreenState();
}

class _GramineaSearchScreenState extends State<GramineaSearchScreen> {
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
          title: Text("Pesquisa de gramínea"),
          backgroundColor: Color.fromRGBO(18, 154, 200, 1),
        ),
        body: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: searchTextController,
                  onChanged: (value) {
                    print(searchTextController.text);
                  },
                  decoration: InputDecoration(
                      labelText: 'Termo de busca:',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.filter_alt)),
                ),
              )
            ],
          ),
        ));
  }
}
