import 'package:flutter/material.dart';
import '../database/dao/contact_dao.dart';
import '../models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _account = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Alexandre',
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              TextField(
                controller: _account,
                decoration: const InputDecoration(
                  labelText: 'Account Number',
                  hintText: '0000',
                ),
                style: const TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      final String nome = _name.text;
                      final int? account = int.tryParse(_account.text);
                      final contact =  Contact(0,nome, account!);
                      ContactDAO.save(contact).then((id) {
                        Navigator.pop(context);
                      } );
                    },
                    child: const Text('Save'),
                  ),
                ),
              )
            ],
          ),
        )],
      ),
    );
  }
}
