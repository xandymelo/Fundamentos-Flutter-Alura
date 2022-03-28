import 'package:bytebank/widgets/centered_message.dart';
import 'package:flutter/material.dart';
import '../html/web_clients/transaction_webclient.dart';
import '../models/transaction.dart';
import '../widgets/progress.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _client = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
          future: _client.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Progress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.data != null) {
                  final List<Transaction> transactions =
                      snapshot.data as List<Transaction>;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.accountnumber.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );
                }
            }
            return const CenteredMessage(
              'No transactions found',
              icon: Icons.warning,
            );
          },
        ));
  }
}
