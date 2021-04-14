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
  final textEditingController = TextEditingController();
  // Instânica para acesso aos serviços de graminea
  final gramineaService = GramineaService();
  // O termo desejado para busca
  String searchTerm;
  // Datasource para lista de grmineas
  Future<List<Graminea>> futureGramineasList;

  @override
  void initState() {
    super.initState();
    futureGramineasList = gramineaService.fetchGramineas();
    searchTerm = "";
  }

  @override
  void dispose() {
    super.dispose();
    // Zerar os dados pesquisados ou qualquer resquício de busca feita
    textEditingController.dispose();
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
                    controller: textEditingController,
                    decoration: InputDecoration(labelText: 'Termo de busca:', border: OutlineInputBorder(), suffixIcon: Icon(Icons.filter_alt)),
                    onChanged: (value) {
                      setState(() {
                        searchTerm = value;
                      });
                    },
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10)),
            // Container(
            //   child: ElevatedButton(
            //     child: Text('Pesquisar'),
            //     onPressed: () {
            //       setState(() {
            //         this.searchTerm = textEditingController.text;
            //       });
            //     },
            //   ),
            // ),
            Expanded(
                child: FutureBuilder<List<Graminea>>(
                    future: futureGramineasList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Graminea> gramineasList = gramineaService.browseGramineasByFilter(snapshot.data, searchTerm);
                        return ListView.builder(
                          itemCount: gramineasList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          gramineasList[index].nomeComum,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(gramineasList[index].nomeCientifico)
                                      ],
                                    ),
                                    ElevatedButton(
                                      child: Text('Ver'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text('Digite o termo desejado.'),
                        );
                      }
                    })),
          ],
        ));
  }
}
