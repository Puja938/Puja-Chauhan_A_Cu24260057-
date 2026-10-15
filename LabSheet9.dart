
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 1. JSON Parsing
class Student {
  String name;
  Student(this.name);
  factory Student.fromJson(Map j) => Student(j['name']);
}

void main() => runApp(MaterialApp(home: Lab()));

class Lab extends StatefulWidget {
  @override
  State<Lab> createState() => _LabState();
}

class _LabState extends State<Lab> {
  String out = '';
  List data = [];
  bool loading = false;
  final search = TextEditingController();
  final base = 'https://jsonplaceholder.typicode.com';

  // 3, 4, 6, 7, 8, 9, 11, 15: Fetch and parse API
  Future<void> fetch(String url) async {
    setState(() => loading = true);
    try {
      var r = await http.get(Uri.parse(url));
      if (r.statusCode != 200) throw Exception();
      var j = jsonDecode(r.body);
      data = j is List ? j : [j];
      out = 'Data loaded successfully';
    } catch (_) {
      out = 'Error! Check internet and retry.';
    }
    setState(() => loading = false);
  }

  // 14. POST request
  Future<void> send() async {
    try {
      var r = await http.post(Uri.parse('$base/posts'),
          body: {'title': 'Hello', 'body': 'Flutter', 'userId': '1'});
      setState(() => out = r.body);
    } catch (_) {
      setState(() => out = 'Network Error');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Lab Sheet 9')),
    body: ListView(padding: EdgeInsets.all(12), children: [
      // 1
      ElevatedButton(onPressed: () => setState(() {
        out = Student.fromJson({'name': 'Puja'}).name;
      }), child: Text('1. JSON Parsing')),

      // 2
      ElevatedButton(onPressed: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() => out = 'Hello after delay');
      }, child: Text('2. Async Await')),

      // 3
      ElevatedButton(onPressed: () => fetch('$base/posts/1'),
          child: Text('3. Fetch API')),

      // 4
      ElevatedButton(onPressed: () => fetch('$base/posts/1'),
          child: Text('4. Single Post')),

      // 5
      ElevatedButton(onPressed: () => fetch('$base/posts'),
          child: Text('5. Loading Indicator')),

      // 6
      ElevatedButton(onPressed: () => fetch('$base/posts/1'),
          child: Text('6. Future Data')),

      // 7
      ElevatedButton(onPressed: () => fetch('$base/posts'),
          child: Text('7. Post Titles')),

      // 8
      ElevatedButton(onPressed: () => fetch('$base/users'),
          child: Text('8. Users and Emails')),

      // 9
      ElevatedButton(onPressed: () => fetch('$base/users'),
          child: Text('9. Model Data')),

      // 10
      ElevatedButton(onPressed: () => fetch('$base/invalid'),
          child: Text('10. Error Handling')),

      // 11
      ElevatedButton(onPressed: () => fetch('$base/users/1'),
          child: Text('11. User Details')),

      // 12
      TextField(controller: search, onChanged: (_) => setState(() {}),
          decoration: InputDecoration(hintText: '12. Search data')),

      // 13
      ElevatedButton(onPressed: () => fetch('$base/posts'),
          child: Text('13. Refresh Data')),

      // 14
      ElevatedButton(onPressed: send, child: Text('14. POST Data')),

      // 15
      ElevatedButton(onPressed: () =>
          fetch('https://fakestoreapi.com/products'),
          child: Text('15. Product Store')),

      if (loading) Center(child: CircularProgressIndicator()),
      SelectableText(out),
      ...data.where((x) => x.toString().toLowerCase()
          .contains(search.text.toLowerCase())).map((x) =>
        Card(child: ListTile(
          title: Text('${x['title'] ?? x['name'] ?? x}'),
          subtitle: Text('${x['email'] ?? x['body'] ?? ''}'),
          onTap: () => setState(() => out = x.toString()),
        ))),
    ]),
  );
}
