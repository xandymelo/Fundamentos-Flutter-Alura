import 'dart:async';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbPath = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    dbPath,
    onCreate: (db, version) {
      db.execute(ContactDAO.createtable);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );

}






