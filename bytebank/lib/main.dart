import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBank());
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
