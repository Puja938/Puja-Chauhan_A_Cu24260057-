import 'package:sqflite/sqflite.dart';

// 1. Notes: Add and Display
Future<void> addNote(Database db) async {
  await db.insert('notes', {
    'title': 'Note',
    'content': 'Hello'
  });
  print(await db.query('notes'));
}

// 2. Edit Note
Future<void> editNote(Database db) async {
  await db.update('notes', {'title': 'Updated'},
      where: 'id=?', whereArgs: [1]);
}

// 3. Delete Note
Future<void> deleteNote(Database db) async {
  await db.delete('notes', where: 'id=?', whereArgs: [1]);
}

// 4. Search Notes
Future<void> searchNotes(Database db) async {
  print(await db.query('notes',
      where: 'title LIKE ?', whereArgs: ['%Note%']));
}

// 5. Contact Book
Future<void> addContact(Database db) async {
  await db.insert('contacts',
      {'name': 'Puja', 'phone': '12345'});
  print(await db.query('contacts'));
}

// 6. Delete Contact
Future<void> deleteContact(Database db) async {
  await db.delete('contacts', where: 'id=?', whereArgs: [1]);
}

// 7. Search Contact
Future<void> searchContact(Database db) async {
  print(await db.query('contacts',
      where: 'name LIKE ?', whereArgs: ['%Puja%']));
}

// 8. Expense Tracker
Future<void> addExpense(Database db) async {
  await db.insert('expenses',
      {'title': 'Food', 'amount': 200.0});
  print(await db.query('expenses'));
}

// 9. Total Expense
Future<void> totalExpense(Database db) async {
  print(await db.rawQuery(
      'SELECT SUM(amount) AS total FROM expenses'));
}

// 10. To-Do Task
Future<void> addTask(Database db) async {
  await db.insert('tasks', {'title': 'Study', 'done': 0});
  await db.update('tasks', {'done': 1},
      where: 'id=?', whereArgs: [1]);
}

// 11. Registration
Future<void> register(Database db) async {
  await db.insert('users', {
    'name': 'Puja',
    'email': 'p@gmail.com',
    'password': '123456'
  });
}

// 12. Login
Future<void> login(Database db) async {
  var u = await db.query('users',
      where: 'email=? AND password=?',
      whereArgs: ['p@gmail.com', '123456']);
  print(u.isNotEmpty ? 'Success' : 'Failed');
}

// 13. Form Validation
bool validate(String name, String email) =>
    name.isNotEmpty && email.contains('@');

// 14. Student Management
Future<void> addStudent(Database db) async {
  await db.insert('students',
      {'name': 'Puja', 'course': 'BCA'});
  print(await db.query('students'));
}

// 15. Product Inventory
Future<void> addProduct(Database db) async {
  await db.insert('products',
      {'name': 'Pen', 'quantity': 10, 'price': 10.0});
  await db.update('products', {'quantity': 20},
      where: 'id=?', whereArgs: [1]);
  await db.delete('products', where: 'id=?', whereArgs: [1]);
}

// 16. Shopping Cart
Future<void> cartTotal(Database db) async {
  await db.insert('cart',
      {'name': 'Book', 'price': 100.0, 'quantity': 2});
  print(await db.rawQuery(
      'SELECT SUM(price*quantity) AS total FROM cart'));
}

// 17. Student Records
Future<void> studentRecords(Database db) async {
  print(await db.query('students'));
  await db.update('students', {'name': 'Rahul'},
      where: 'id=?', whereArgs: [1]);
  await db.delete('students', where: 'id=?', whereArgs: [1]);
}
