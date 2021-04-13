import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/modules/graminea/models/Graminea.dart';
import 'package:gramipasto_mobileapp/services/GramineaService.dart';

class GramineaSearchScreen extends StatefulWidget {
  @override
  _GramineaSearchScreenState createState() => _GramineaSearchScreenState();
}

class _GramineaSearchScreenState extends State<GramineaSearchScreen> {
  // Recuperar o valor da pesquisa pelo dado da gramínea
  final searchTextController = TextEditingController();
  // Instânica para acesso aos serviços de graminea
  final gramineaService = GramineaService();
  // Armazenar a lista de gramíneas no estilo datasource
  Future<List<Graminea>> futureGramineasList;
  // Lista com filtro das gramíneas
  Future<List<Graminea>> filteredGramineasList;

  @override
  void initState() {
    super.initState();
    futureGramineasList = gramineaService.fetchGramineas();
  }

  @override
  void dispose() {
    super.dispose();
    // Zerar os dados pesquisados ou qualquer resquício de busca feita
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pesquisa de gramínea"),
          backgroundColor: Color.fromRGBO(18, 154, 200, 1),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                      labelText: 'Termo de busca:',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.filter_alt)),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Pesquisar'),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Graminea>>(
                future: this.filteredGramineasList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data[index].nomeComum);
                      },
                    );
                  } else if (!snapshot.hasData) {
                    return Center (
                      child: Text('Necessário iniciar informar algum termo para busca.'),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ));
  }
}
