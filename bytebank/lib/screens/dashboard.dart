import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

const dashboard = "Dashboard";

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(dashboard),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('bytebank_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Theme
                    .of(context)
                    .primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const ContactsList();
                      },),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 80,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          'Contatos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}