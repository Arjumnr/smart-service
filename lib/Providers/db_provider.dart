// import 'dart:io';

// import 'package:sqflite/sqflite.dart';

// class DBproider {
//   static Database _database;
//   static final DBproider db = DBproider._();

//   DBproider._();

//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await initDB();
//     return _database;
//   }

//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'users.db');
//   }
// }
