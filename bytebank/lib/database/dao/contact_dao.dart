import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDAO {
  static const createtable = 'CREATE TABLE $_tablename('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';
  static const _tablename = 'contacts';
  static const _id = 'id';
  static const _accountNumber = 'account_number';
  static const _name = 'name';


  static Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> contactMap = {};
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountnumber;
    return db.insert(_tablename, contactMap);
  }

  static Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {

      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}