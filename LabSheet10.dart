import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Lab10()));
}

class Lab10 extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  final email = 'test@gmail.com';
  final password = '123456';

  Future<void> run(int n) async {
    final s = db.collection('students');

    switch (n) {
      case 1:
        print('Firebase Connected');
        break;
      case 2:
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        break;
      case 3:
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        break;
      case 4:
        print(auth.currentUser?.email ?? 'Not logged in');
        await auth.signOut();
        break;
      case 5:
        await auth.sendPasswordResetEmail(email: email);
        break;
      case 6:
        await s.add({
          'name': 'Puja',
          'roll': '101',
          'course': 'BCA'
        });
        break;
      case 7:
        final d = await s.get();
        for (var x in d.docs) print(x.data());
        break;
      case 8:
        final d = await s.limit(1).get();
        if (d.docs.isNotEmpty) {
          await d.docs.first.reference.update({'name': 'Rahul'});
        }
        break;
      case 9:
        final d = await s.limit(1).get();
        if (d.docs.isNotEmpty) await d.docs.first.reference.delete();
        break;
      case 10:
        final d = await s.where('course', isEqualTo: 'BCA').get();
        for (var x in d.docs) print(x.data());
        break;
      case 11:
        final d = await s.orderBy('name').get();
        for (var x in d.docs) print(x.data());
        break;
      case 12:
        final d = await s.snapshots().first;
        for (var x in d.docs) print(x.data());
        break;
      case 13:
        await s.add({'name': 'New Student', 'roll': '102', 'course': 'BCA'});
        break;
      case 14:
        await db.collection('notes').add({'note': 'My Note'});
        break;
      case 15:
        await s.add({'name': 'Student', 'roll': '103', 'course': 'BCA'});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab Sheet 10')),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, i) => ListTile(
          title: Text('Program ${i + 1}'),
          trailing: const Icon(Icons.play_arrow),
          onTap: () async {
            try {
              await run(i + 1);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Program executed')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$e')),
              );
            }
          },
        ),
      ),
    );
  }
}
