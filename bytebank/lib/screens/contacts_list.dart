import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';
import '../database/dao/contact_dao.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: ContactDAO.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                     Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return _ContactItem(contacts[index]);
                },
                itemCount: contacts.length,
              );
          }
          return const Text('Unknown Error 404');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const ContactForm();
              },
            ),
          ).then(
            (cont) {
              setState(() {});
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.nameReceived,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          contact.accountReceived.toString(),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
