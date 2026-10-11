
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Sheet 6',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}

class Student {
  String name;
  String roll;
  String course;
  String semester;

  Student({
    required this.name,
    required this.roll,
    required this.course,
    this.semester = '1',
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'roll': roll,
        'course': course,
        'semester': semester,
      };

  factory Student.fromMap(Map<String, dynamic> map) => Student(
        name: map['name'] ?? '',
        roll: map['roll'] ?? '',
        course: map['course'] ?? '',
        semester: map['semester'] ?? '1',
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> programs = const [
    '1. Student Details using Map',
    '2. Student Object to Map',
    '3. Map and JSON Conversion',
    '4. Save User Name',
    '5. Save Counter',
    '6. Dark Mode Setting',
    '7. Remember Me',
    '8. Save Name, Email and Age',
    '9. Save Favourite Subjects',
    '10. Clear SharedPreferences',
    '11. First Launch Welcome',
    '12. Write Text to File',
    '13. Read Text from File',
    '14. Student Object in JSON',
    '15. Saved Task List',
    '16. Notes App with JSON File',
    '17. Student Profile App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab Sheet 6')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(programs[index]),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProgramPage(number: index + 1),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgramPage extends StatefulWidget {
  final int number;
  const ProgramPage({super.key, required this.number});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  final nameC = TextEditingController();
  final rollC = TextEditingController();
  final courseC = TextEditingController();
  final semesterC = TextEditingController(text: '1');
  final emailC = TextEditingController();
  final ageC = TextEditingController();
  final textC = TextEditingController();

  String output = '';
  String savedName = '';
  bool remember = false;
  bool darkMode = false;
  int counter = 0;
  List<String> subjects = [];
  List<String> tasks = [];
  List<String> notes = [];
  Student? student;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    nameC.dispose();
    rollC.dispose();
    courseC.dispose();
    semesterC.dispose();
    emailC.dispose();
    ageC.dispose();
    textC.dispose();
    super.dispose();
  }

  Future<File> getFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  Future<void> loadData() async {
    final p = await SharedPreferences.getInstance();

    if (widget.number == 4) {
      savedName = p.getString('userName') ?? '';
    } else if (widget.number == 5) {
      counter = p.getInt('counter') ?? 0;
    } else if (widget.number == 6) {
      darkMode = p.getBool('darkMode') ?? false;
    } else if (widget.number == 7) {
      remember = p.getBool('remember') ?? false;
      if (remember) nameC.text = p.getString('loginName') ?? '';
    } else if (widget.number == 8) {
      nameC.text = p.getString('profileName') ?? '';
      emailC.text = p.getString('profileEmail') ?? '';
      ageC.text = p.getString('profileAge') ?? '';
    } else if (widget.number == 9) {
      subjects = p.getStringList('subjects') ?? [];
    } else if (widget.number == 11) {
      final first = p.getBool('alreadyOpened') ?? false;
      output = first ? 'Welcome back!' : 'Welcome! This is your first launch.';
      await p.setBool('alreadyOpened', true);
    } else if (widget.number == 14) {
      final data = p.getString('studentJson');
      if (data != null) {
        student = Student.fromMap(jsonDecode(data));
      }
    } else if (widget.number == 15) {
      tasks = p.getStringList('tasks') ?? [];
    } else if (widget.number == 16) {
      try {
        final file = await getFile('notes.json');
        if (await file.exists()) {
          notes = List<String>.from(jsonDecode(await file.readAsString()));
        }
      } catch (_) {
        notes = [];
      }
    } else if (widget.number == 17) {
      final data = p.getString('studentProfile');
      if (data != null) {
        student = Student.fromMap(jsonDecode(data));
        fillStudentFields();
      }
    }

    if (mounted) setState(() {});
  }

  void fillStudentFields() {
    if (student == null) return;
    nameC.text = student!.name;
    rollC.text = student!.roll;
    courseC.text = student!.course;
    semesterC.text = student!.semester;
  }

  Future<void> saveStudent(int program) async {
    if (nameC.text.trim().isEmpty ||
        rollC.text.trim().isEmpty ||
        courseC.text.trim().isEmpty) {
      showMessage('Please fill name, roll number and course.');
      return;
    }

    final s = Student(
      name: nameC.text.trim(),
      roll: rollC.text.trim(),
      course: courseC.text.trim(),
      semester: semesterC.text.trim(),
    );

    final p = await SharedPreferences.getInstance();
    final key = program == 14 ? 'studentJson' : 'studentProfile';
    await p.setString(key, jsonEncode(s.toMap()));

    setState(() {
      student = s;
      output = 'Student details saved successfully.';
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget field(String label, TextEditingController controller,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget actionButton(String text, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: action,
        child: Text(text),
      ),
    );
  }

  Widget studentDisplay() {
    if (student == null) return const Text('No student saved yet.');
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(student!.name),
        subtitle: Text(
          'Roll: ${student!.roll}\n'
          'Course: ${student!.course}\n'
          'Semester: ${student!.semester}',
        ),
      ),
    );
  }

  Widget listEditor(List<String> list, String keyName) {
    return Column(
      children: [
        field('Enter item', textC),
        actionButton('Add Item', () async {
          final value = textC.text.trim();
          if (value.isEmpty) return;

          setState(() {
            list.add(value);
            textC.clear();
          });

          if (keyName == 'subjects' || keyName == 'tasks') {
            final p = await SharedPreferences.getInstance();
            await p.setStringList(keyName, list);
          } else {
            final file = await getFile('notes.json');
            await file.writeAsString(jsonEncode(list));
          }
        }),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  setState(() => list.removeAt(index));

                  if (keyName == 'subjects' || keyName == 'tasks') {
                    final p = await SharedPreferences.getInstance();
                    await p.setStringList(keyName, list);
                  } else {
                    final file = await getFile('notes.json');
                    await file.writeAsString(jsonEncode(list));
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProgram() {
    switch (widget.number) {
      case 1:
        final map = {
          'Name': 'Puja',
          'Roll Number': '101',
          'Course': 'BCA',
        };
        return ListView(
          children: map.entries
              .map((e) => ListTile(
                    title: Text(e.key),
                    subtitle: Text(e.value),
                  ))
              .toList(),
        );

      case 2:
        final s = Student(
          name: 'Puja',
          roll: '101',
          course: 'BCA',
        );
        final map = s.toMap();
        final restored = Student.fromMap(map);
        return Center(
          child: Text(
            'Student Map:\n${jsonEncode(map)}\n\n'
            'Restored Student:\n${restored.name}, '
            '${restored.roll}, ${restored.course}',
            textAlign: TextAlign.center,
          ),
        );

      case 3:
        final map = {'name': 'Puja', 'course': 'BCA'};
        final jsonString = jsonEncode(map);
        final decoded = jsonDecode(jsonString);
        return Center(
          child: Text(
            'Map:\n$map\n\nJSON String:\n$jsonString\n\n'
            'Decoded Map:\n$decoded',
            textAlign: TextAlign.center,
          ),
        );

      case 4:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Enter your name', nameC),
            actionButton('Save Name', () async {
              final p = await SharedPreferences.getInstance();
              await p.setString('userName', nameC.text);
              setState(() => savedName = nameC.text);
            }),
            Text('Saved Name: $savedName'),
          ],
        );

      case 5:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: const TextStyle(fontSize: 40)),
              actionButton('Increment and Save', () async {
                final p = await SharedPreferences.getInstance();
                setState(() => counter++);
                await p.setInt('counter', counter);
              }),
              actionButton('Reset', () async {
                final p = await SharedPreferences.getInstance();
                setState(() => counter = 0);
                await p.setInt('counter', 0);
              }),
            ],
          ),
        );

      case 6:
        return SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: Text(darkMode ? 'ON' : 'OFF'),
          value: darkMode,
          onChanged: (value) async {
            final p = await SharedPreferences.getInstance();
            await p.setBool('darkMode', value);
            setState(() => darkMode = value);
          },
        );

      case 7:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Username', nameC),
            CheckboxListTile(
              title: const Text('Remember Me'),
              value: remember,
              onChanged: (v) => setState(() => remember = v ?? false),
            ),
            actionButton('Login / Save Setting', () async {
              final p = await SharedPreferences.getInstance();
              await p.setBool('remember', remember);
              if (remember) {
                await p.setString('loginName', nameC.text);
              } else {
                await p.remove('loginName');
              }
              showMessage('Remember Me setting saved.');
            }),
          ],
        );

      case 8:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Name', nameC),
            field('Email', emailC),
            field('Age', ageC, type: TextInputType.number),
            actionButton('Save Details', () async {
              final p = await SharedPreferences.getInstance();
              await p.setString('profileName', nameC.text);
              await p.setString('profileEmail', emailC.text);
              await p.setString('profileAge', ageC.text);
              showMessage('Details saved.');
            }),
          ],
        );

      case 9:
        return listEditor(subjects, 'subjects');

      case 10:
        return Center(
          child: actionButton('Clear All SharedPreferences', () async {
            final p = await SharedPreferences.getInstance();
            await p.clear();
            setState(() {
              savedName = '';
              counter = 0;
              subjects.clear();
              tasks.clear();
              student = null;
              output = 'All stored preferences cleared.';
            });
            showMessage('SharedPreferences cleared.');
          }),
        );

      case 11:
        return Center(
          child: Text(
            output,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22),
          ),
        );

      case 12:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Text to save in file', textC),
            actionButton('Write to File', () async {
              final file = await getFile('sample.txt');
              await file.writeAsString(textC.text);
              showMessage('Text saved to ${file.path}');
            }),
          ],
        );

      case 13:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            actionButton('Read File', () async {
              final file = await getFile('sample.txt');
              if (await file.exists()) {
                setState(() => output = await file.readAsString());
              } else {
                setState(() => output = 'File not found. Write text first.');
              }
            }),
            SelectableText(output),
          ],
        );

      case 14:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Student Name', nameC),
            field('Roll Number', rollC),
            field('Course', courseC),
            actionButton('Save Student as JSON', () => saveStudent(14)),
            studentDisplay(),
          ],
        );

      case 15:
        return listEditor(tasks, 'tasks');

      case 16:
        return listEditor(notes, 'notes');

      case 17:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            field('Student Name', nameC),
            field('Roll Number', rollC),
            field('Course', courseC),
            field('Semester', semesterC),
            actionButton('Save / Update Profile', () => saveStudent(17)),
            actionButton('Clear Profile', () async {
              final p = await SharedPreferences.getInstance();
              await p.remove('studentProfile');
              setState(() {
                student = null;
                nameC.clear();
                rollC.clear();
                courseC.clear();
                semesterC.text = '1';
              });
              showMessage('Student profile cleared.');
            }),
            studentDisplay(),
          ],
        );

      default:
        return const Center(child: Text('Program not found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Program ${widget.number}')),
      body: buildProgram(),
    );
  }
}
