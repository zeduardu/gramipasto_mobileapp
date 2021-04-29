import 'package:flutter/material.dart';

class SearchTermWidget extends StatelessWidget {
  final void Function(String)? onChanged;

  SearchTermWidget({Key? key, this.onChanged, }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(labelText: 'Termo de busca:', border: OutlineInputBorder(), suffixIcon: Icon(Icons.filter_alt)),
            onChanged: this.onChanged,
          ),
        ),
        margin: EdgeInsets.only(bottom: 10));
  }
}
