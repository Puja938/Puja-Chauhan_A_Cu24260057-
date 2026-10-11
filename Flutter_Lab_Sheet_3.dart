Lab Sheet–3: Flutter User Input and Basic Interaction
import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Lab Sheet 3',
theme: ThemeData(
primarySwatch: Colors.indigo,
useMaterial3: true,
),
home: const LabHome(),
);
}
}

class LabHome extends StatelessWidget {
const LabHome({super.key});

@override
Widget build(BuildContext context) {
final programs = [
'Student Name',
'Sum of Two Numbers',
'Arithmetic Operations',
'Change Text Button',
'SnackBar Message',
'Submit and Reset Form',
'Student Total Marks',
'Percentage Calculator',
'Even or Odd',
'Positive, Negative or Zero',
'Celsius to Fahrenheit',
'Area of Rectangle',
'BMI Calculator',
'Terms Checkbox',
'Select Gender',
'Select Course',
'Select Semester',
'Select Department',
'ON/OFF Switch',
'Combined Widgets',
'Login Form',
'Registration Form',
'Student Feedback Form',
'Simple Calculator',
'Student Result',
];

return Scaffold(  
  appBar: AppBar(title: const Text('Lab Sheet 3')),  
  body: ListView.builder(  
    itemCount: programs.length,  
    itemBuilder: (context, index) {  
      return ListTile(  
        leading: CircleAvatar(child: Text('${index + 1}')),  
        title: Text(programs[index]),  
        trailing: const Icon(Icons.arrow_forward),  
        onTap: () {  
          Navigator.push(  
            context,  
            MaterialPageRoute(  
              builder: (_) => ProgramPage(  
                number: index + 1,  
                title: programs[index],  
              ),  
            ),  
          );  
        },  
      );  
    },  
  ),  
);

}
}

class ProgramPage extends StatefulWidget {
final int number;
final String title;

const ProgramPage({
super.key,
required this.number,
required this.title,
});

@override
State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
final name = TextEditingController();
final first = TextEditingController();
final second = TextEditingController();
final third = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
final feedback = TextEditingController();

String output = '';
String gender = 'Female';
String course = 'BCA';
String semester = 'Semester 1';
String department = 'Computer Science';
String rating = '5';
String operation = '+';
bool agreed = false;
bool setting = false;

double value(TextEditingController c) =>
double.tryParse(c.text.trim()) ?? 0;

Widget input(String label, TextEditingController c,
{bool secret = false}) {
return Padding(
padding: const EdgeInsets.all(8),
child: TextField(
controller: c,
obscureText: secret,
keyboardType: secret
? TextInputType.text
: TextInputType.numberWithOptions(decimal: true),
decoration: InputDecoration(
labelText: label,
border: const OutlineInputBorder(),
),
),
);
}

Widget button(String text, VoidCallback action) {
return Padding(
padding: const EdgeInsets.all(8),
child: ElevatedButton(
onPressed: action,
child: Text(text),
),
);
}

Widget dropdown(
String label,
String current,
List<String> options,
ValueChanged<String?> onChanged,
) {
return Padding(
padding: const EdgeInsets.all(8),
child: DropdownButtonFormField<String>(
value: current,
decoration: InputDecoration(
labelText: label,
border: const OutlineInputBorder(),
),
items: options
.map((e) => DropdownMenuItem(value: e, child: Text(e)))
.toList(),
onChanged: onChanged,
),
);
}

void showOutput(String text) {
setState(() => output = text);
}

@override
void dispose() {
name.dispose();
first.dispose();
second.dispose();
third.dispose();
email.dispose();
password.dispose();
feedback.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final n = widget.number;
final List<Widget> ui = [];

switch (n) {  
  case 1:  
    ui.add(input('Student Name', name));  
    ui.add(button('Display Name', () =>  
        showOutput('Student Name: ${name.text}')));  
    break;  

  case 2:  
    ui.add(input('First Number', first));  
    ui.add(input('Second Number', second));  
    ui.add(button('Calculate Sum', () =>  
        showOutput('Sum = ${value(first) + value(second)}')));  
    break;  

  case 3:  
  case 24:  
    ui.add(input('First Number', first));  
    ui.add(input('Second Number', second));  
    ui.add(dropdown('Operation', operation,  
        ['+', '-', '*', '/'],  
        (v) => setState(() => operation = v!)));  
    ui.add(button('Calculate', () {  
      final x = value(first);  
      final y = value(second);  

      if (operation == '/' && y == 0) {  
        showOutput('Cannot divide by zero');  
        return;  
      }  

      final result = operation == '+'  
          ? x + y  
          : operation == '-'  
              ? x - y  
              : operation == '*'  
                  ? x * y  
                  : x / y;  

      showOutput('Result = $result');  
    }));  
    break;  

  case 4:  
    ui.add(Text(  
      output.isEmpty ? 'Hello! Press the button.' : output,  
      style: const TextStyle(fontSize: 20),  
    ));  
    ui.add(button('Change Text', () =>  
        showOutput('Button Pressed Successfully!')));  
    break;  

  case 5:  
    ui.add(button('Show SnackBar', () {  
      ScaffoldMessenger.of(context).showSnackBar(  
        const SnackBar(content: Text('Hello! SnackBar Message')),  
      );  
    }));  
    break;  

  case 6:  
    ui.add(input('Student Name', name));  
    ui.add(input('Email', email));  
    ui.add(button('Submit', () =>  
        showOutput('Form submitted for ${name.text}')));  
    ui.add(button('Reset', () {  
      name.clear();  
      email.clear();  
      showOutput('Form reset');  
    }));  
    break;  

  case 7:  
  case 8:  
  case 25:  
    ui.add(input('Student Name', name));  
    ui.add(input('Subject 1 Marks', first));  
    ui.add(input('Subject 2 Marks', second));  
    ui.add(input('Subject 3 Marks', third));  
    ui.add(button('Calculate Result', () {  
      final total = value(first) + value(second) + value(third);  
      final percentage = total / 3;  

      if (n == 7) {  
        showOutput('Total Marks = $total / 300');  
      } else if (n == 8) {  
        showOutput(  
            'Percentage = ${percentage.toStringAsFixed(2)}%');  
      } else {  
        final pass = value(first) >= 33 &&  
            value(second) >= 33 &&  
            value(third) >= 33;  

        showOutput(  
          'Student: ${name.text}\n'  
          'Total = $total / 300\n'  
          'Percentage = ${percentage.toStringAsFixed(2)}%\n'  
          'Result: ${pass ? "PASS" : "FAIL"}',  
        );  
      }  
    }));  
    break;  

  case 9:  
    ui.add(input('Enter Number', first));  
    ui.add(button('Check', () => showOutput(  
        value(first) % 2 == 0 ? 'Even Number' : 'Odd Number')));  
    break;  

  case 10:  
    ui.add(input('Enter Number', first));  
    ui.add(button('Check', () {  
      final x = value(first);  
      showOutput(x > 0  
          ? 'Positive Number'  
          : x < 0  
              ? 'Negative Number'  
              : 'Zero');  
    }));  
    break;  

  case 11:  
    ui.add(input('Temperature in Celsius', first));  
    ui.add(button('Convert', () => showOutput(  
        'Fahrenheit = ${(value(first) * 9 / 5 + 32).toStringAsFixed(2)} °F')));  
    break;  

  case 12:  
    ui.add(input('Length', first));  
    ui.add(input('Width', second));  
    ui.add(button('Calculate Area', () =>  
        showOutput('Area = ${value(first) * value(second)}')));  
    break;  

  case 13:  
    ui.add(input('Weight in kg', first));  
    ui.add(input('Height in metres', second));  
    ui.add(button('Calculate BMI', () {  
      final h = value(second);  
      if (h <= 0) {  
        showOutput('Enter valid height in metres');  
      } else {  
        showOutput('BMI = ${(value(first) / (h * h)).toStringAsFixed(2)}');  
      }  
    }));  
    break;  

  case 14:  
    ui.add(CheckboxListTile(  
      title: const Text('I agree to the terms and conditions'),  
      value: agreed,  
      onChanged: (v) => setState(() => agreed = v ?? false),  
    ));  
    ui.add(button('Continue', () => showOutput(  
        agreed ? 'Terms accepted' : 'Please accept the terms')));  
    break;  

  case 15:  
    ui.addAll(['Female', 'Male', 'Other'].map(  
      (v) => RadioListTile<String>(  
        title: Text(v),  
        value: v,  
        groupValue: gender,  
        onChanged: (x) => setState(() => gender = x!),  
      ),  
    ));  
    ui.add(button('Show Gender', () =>  
        showOutput('Gender: $gender')));  
    break;  

  case 16:  
    ui.add(dropdown('Course', course, ['BCA', 'BBA', 'MCA'],  
        (v) => setState(() => course = v!)));  
    ui.add(button('Show Course', () =>  
        showOutput('Course: $course')));  
    break;  

  case 17:  
    ui.add(dropdown('Semester', semester,  
        List.generate(8, (i) => 'Semester ${i + 1}'),  
        (v) => setState(() => semester = v!)));  
    ui.add(button('Show Semester', () => showOutput(semester)));  
    break;  

  case 18:  
    ui.add(dropdown('Department', department,  
        ['Computer Science', 'Management', 'Commerce'],  
        (v) => setState(() => department = v!)));  
    ui.add(button('Show Department', () =>  
        showOutput('Department: $department')));  
    break;  

  case 19:  
    ui.add(SwitchListTile(  
      title: const Text('Setting'),  
      value: setting,  
      onChanged: (v) => setState(() => setting = v),  
    ));  
    ui.add(Text('Setting is ${setting ? "ON" : "OFF"}'));  
    break;  

  case 20:  
    ui.add(CheckboxListTile(  
      title: const Text('Accept Terms'),  
      value: agreed,  
      onChanged: (v) => setState(() => agreed = v ?? false),  
    ));  
    ui.addAll(['Female', 'Male', 'Other'].map(  
      (v) => RadioListTile<String>(  
        title: Text(v),  
        value: v,  
        groupValue: gender,  
        onChanged: (x) => setState(() => gender = x!),  
      ),  
    ));  
    ui.add(dropdown('Course', course, ['BCA', 'BBA', 'MCA'],  
        (v) => setState(() => course = v!)));  
    ui.add(SwitchListTile(  
      title: const Text('Notifications'),  
      value: setting,  
      onChanged: (v) => setState(() => setting = v),  
    ));  
    ui.add(button('Show Values', () => showOutput(  
      'Agreed: $agreed\nGender: $gender\n'  
      'Course: $course\nNotifications: $setting',  
    )));  
    break;  

  case 21:  
    ui.add(input('Username', name));  
    ui.add(input('Password', password, secret: true));  
    ui.add(button('Login', () => showOutput(  
        name.text.isNotEmpty && password.text.isNotEmpty  
            ? 'Login submitted'  
            : 'Enter username and password')));  
    ui.add(button('Reset', () {  
      name.clear();  
      password.clear();  
      showOutput('Fields cleared');  
    }));  
    break;  

  case 22:  
    ui.add(input('Name', name));  
    ui.add(input('Email', email));  
    ui.add(input('Password', password, secret: true));  
    ui.add(dropdown('Gender', gender, ['Female', 'Male', 'Other'],  
        (v) => setState(() => gender = v!)));  
    ui.add(dropdown('Course', course, ['BCA', 'BBA', 'MCA'],  
        (v) => setState(() => course = v!)));  
    ui.add(button('Register', () => showOutput(  
        'Registered: ${name.text}\n$gender, $course')));  
    break;  

  case 23:  
    ui.add(input('Student Name', name));  
    ui.add(dropdown('Rating', rating, ['1', '2', '3', '4', '5'],  
        (v) => setState(() => rating = v!)));  
    ui.add(input('Feedback', feedback));  
    ui.add(button('Submit Feedback', () => showOutput(  
        'Thank you, ${name.text}! Rating: $rating/5')));  
    break;  
}  

return Scaffold(  
  appBar: AppBar(title: Text('${widget.number}. ${widget.title}')),  
  body: ListView(  
    padding: const EdgeInsets.all(16),  
    children: [  
      ...ui,  
      if (output.isNotEmpty)  
        Card(  
          margin: const EdgeInsets.all(8),  
          child: Padding(  
            padding: const EdgeInsets.all(16),  
            child: Text(output, style: const TextStyle(fontSize: 18)),  
          ),  
        ),  
    ],  
  ),  
);

}
}

/*
SAMPLE OUTPUTS
Q1: Student Name: Puja
Q2: Sum = 30 (10 + 20)
Q3: Result = 30 (10 + 20)
Q4: Button Pressed Successfully!
Q5: SnackBar: Hello! SnackBar Message
Q6: Form submitted for Puja
Q7: Total Marks = 240 / 300 (80, 75, 85)
Q8: Percentage = 80.00%
Q9: Even Number (input 8)
Q10: Positive Number (input 5)
Q11: Fahrenheit = 98.60 °F (input 37°C)
Q12: Area = 50 (length 10, width 5)
Q13: BMI = 22.86 (70 kg, 1.75 m)
Q14: Terms accepted
Q15: Gender: Female
Q16: Course: BCA
Q17: Semester 1
Q18: Department: Computer Science
Q19: Setting is ON
Q20: Shows selected checkbox, gender, course and switch values
Q21: Login submitted
Q22: Registered: Puja, Female, BCA
Q23: Thank you, Puja! Rating: 5/5
Q24: Result = 30 (10 + 20)
Q25: Total = 240/300, Percentage = 80.00%, Result: PASS
*/

Sample output note: Q7–Q8 aur Q25 mein 80, 75, 85 enter karne par total 240 aur percentage 80% aayegi. Baaki outputs input ke according change honge.  Yh h ky
