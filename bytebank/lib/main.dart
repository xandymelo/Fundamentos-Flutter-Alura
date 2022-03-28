import 'package:bytebank/html/webclient.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';
import 'models/transaction.dart';

void main() {
  runApp(const ByteBank());
  // Save(Transaction(200, Contact(0, 'Francys', 3456))).then((transacao) => debugPrint('$transacao'));
  // findAll().then((transactions) => debugPrint('transactions: $transactions'));
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: Colors.green[800],
          )
      ),
      home: const Dashboard(),
    );
  }
}
