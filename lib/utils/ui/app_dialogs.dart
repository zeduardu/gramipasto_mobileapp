import 'package:flutter/material.dart';

Future<void> showInformationDialog(
    BuildContext context, String title, String content) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'))
        ],
      );
    },
  );
}
