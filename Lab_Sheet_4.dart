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
      title: 'Lab Sheet 4',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

const programs = [
  'Two Screens Navigation',
  'Home and About Screen',
  'Home, Profile and Settings',
  'Login to Home Screen',
  'Home to Profile Screen',
  'Navigator.push()',
  'Navigator.pop()',
  'Forward and Backward Navigation',
  'Bottom Navigation Bar',
  'Switch Three Screens',
  'Navigation Drawer',
  'Drawer Screen Options',
  'Drawer with Icons and Text',
  'Home, Courses and Contact',
  'Student Profile, Attendance and Result',
  'Pass Student Name',
  'Pass Name and Course',
  'Student Name Form',
  'Pass Two Numbers and Sum',
  'Product Name and Price',
  'Student List and Detail',
  'Login, Home and Profile',
  'College App Navigation',
  'Shopping App Navigation',
  'Student Management App',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab Sheet 4')),
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
                  builder: (_) => ProgramScreen(
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

class ProgramScreen extends StatefulWidget {
  final int number;
  final String title;

  const ProgramScreen({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  final name = TextEditingController();
  final course = TextEditingController(text: 'BCA');
  final first = TextEditingController(text: '10');
  final second = TextEditingController(text: '20');
  final price = TextEditingController(text: '499');

  int selectedTab = 0;

  @override
  void dispose() {
    name.dispose();
    course.dispose();
    first.dispose();
    second.dispose();
    price.dispose();
    super.dispose();
  }

  void openScreen(String title, String details) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          title: title,
          details: details,
        ),
      ),
    );
  }

  Widget field(String label, TextEditingController controller,
      {bool numeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextField(
        controller: controller,
        keyboardType:
            numeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget action(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  Widget navigationDemo(List<String> labels) {
    return Column(
      children: [
        const Icon(Icons.phone_android,
            size: 65, color: Colors.indigo),
        Text(
          labels[selectedTab],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: List.generate(labels.length, (i) {
            return ChoiceChip(
              label: Text(labels[i]),
              selected: selectedTab == i,
              onSelected: (_) => setState(() => selectedTab = i),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.number;
    Widget content;

    // Q1, Q2, Q5, Q6, Q7, Q8
    if ([1, 2, 5, 6, 7, 8].contains(n)) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.home, size: 65, color: Colors.indigo),
          const Text(
            'First Screen',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
          action('Go to Second Screen', () {
            openScreen(
              'Second Screen',
              'Welcome to the second screen!',
            );
          }),
          if (n == 2)
            action('About', () {
              openScreen('About', 'This is the About screen.');
            }),
          if (n == 5)
            action('Open Profile', () {
              openScreen('Profile', 'Student profile screen.');
            }),
          if (n == 7)
            const Text('Use the back arrow to return.'),
        ],
      );
    }

    // Q3
    else if (n == 3) {
      content = Column(
        children: [
          navigationDemo(['Home', 'Profile', 'Settings']),
          action('Open Selected Screen', () {
            openScreen(
              ['Home', 'Profile', 'Settings'][selectedTab],
              'Selected screen opened successfully.',
            );
          }),
        ],
      );
    }

    // Q4 and Q22
    else if (n == 4 || n == 22) {
      content = Column(
        children: [
          field('Username', name),
          field('Password', course),
          action('Login', () {
            openScreen(
              'Home Screen',
              'Welcome ${name.text.isEmpty ? "Student" : name.text}!',
            );
          }),
        ],
      );
    }

    // Q9, Q10, Q14, Q23, Q24
    else if ([9, 10, 14, 23, 24].contains(n)) {
      final labels = n == 14
          ? ['Home', 'Courses', 'Contact']
          : n == 23
              ? ['Home', 'Courses', 'Faculty', 'Contact']
              : n == 24
                  ? ['Home', 'Products', 'Cart', 'Profile']
                  : ['Home', 'Profile', 'Settings'];

      content = navigationDemo(labels);
    }

    // Q11, Q12, Q13
    else if ([11, 12, 13].contains(n)) {
      content = Column(
        children: [
          const Icon(Icons.home, size: 60, color: Colors.indigo),
          const Text('Home Screen', style: TextStyle(fontSize: 22)),
          const Text('Open the drawer from the top-left menu.'),
        ],
      );
    }

    // Q15 and Q25
    else if (n == 15 || n == 25) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          action('Student Profile', () {
            openScreen('Student Profile', 'Name: Puja\nCourse: BCA');
          }),
          action('Attendance', () {
            openScreen('Attendance', 'Attendance: 90%');
          }),
          action('Result', () {
            openScreen('Result', 'Result: PASS');
          }),
        ],
      );
    }

    // Q16, Q17, Q18
    else if ([16, 17, 18].contains(n)) {
      content = Column(
        children: [
          field('Student Name', name),
          if (n == 17) field('Course', course),
          action('Submit', () {
            final details = n == 17
                ? 'Name: ${name.text}\nCourse: ${course.text}'
                : 'Student Name: ${name.text}';

            openScreen('Student Details', details);
          }),
        ],
      );
    }

    // Q19
    else if (n == 19) {
      content = Column(
        children: [
          field('First Number', first, numeric: true),
          field('Second Number', second, numeric: true),
          action('Calculate Sum', () {
            final a = double.tryParse(first.text) ?? 0;
            final b = double.tryParse(second.text) ?? 0;

            openScreen('Sum Result', 'Sum = ${a + b}');
          }),
        ],
      );
    }

    // Q20
    else if (n == 20) {
      content = Column(
        children: [
          field('Product Name', name),
          field('Price', price, numeric: true),
          action('Product Details', () {
            openScreen(
              'Product Details',
              'Product: ${name.text}\nPrice: ₹${price.text}',
            );
          }),
        ],
      );
    }

    // Q21
    else if (n == 21) {
      content = Column(
        children: [
          for (final student in [
            'Puja - BCA - Semester 5',
            'Rahul - BCA - Semester 5',
            'Nidhi - BBA - Semester 5',
          ])
            action(student, () {
              openScreen('Student Detail', student);
            }),
        ],
      );
    } else {
      content = const Text('Navigation Application');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.number}. ${widget.title}'),
      ),
      drawer: [11, 12, 13].contains(n)
          ? Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Text(
                      'Navigation Menu',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  for (final item in [
                    'Home',
                    'Profile',
                    'About',
                    'Settings'
                  ])
                    ListTile(
                      leading: const Icon(Icons.circle_outlined),
                      title: Text(item),
                      onTap: () {
                        Navigator.pop(context);
                        openScreen(item, '$item screen selected.');
                      },
                    ),
                ],
              ),
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [content],
      ),
      bottomNavigationBar: [9, 10, 14, 23, 24].contains(n)
          ? NavigationBar(
              selectedIndex: selectedTab,
              onDestinationSelected: (index) {
                setState(() => selectedTab = index);
              },
              destinations: (n == 14
                      ? const [
                          ('Home', Icons.home),
                          ('Courses', Icons.school),
                          ('Contact', Icons.contact_mail),
                        ]
                      : n == 23
                          ? const [
                              ('Home', Icons.home),
                              ('Courses', Icons.school),
                              ('Faculty', Icons.people),
                              ('Contact', Icons.contact_mail),
                            ]
                          : n == 24
                              ? const [
                                  ('Home', Icons.home),
                                  ('Products', Icons.shopping_bag),
                                  ('Cart', Icons.shopping_cart),
                                  ('Profile', Icons.person),
                                ]
                              : const [
                                  ('Home', Icons.home),
                                  ('Profile', Icons.person),
                                  ('Settings', Icons.settings),
                                ])
                  .map(
                    (item) => NavigationDestination(
                      icon: Icon(item.$2),
                      label: item.$1,
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String details;

  const DetailScreen({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

/*
SAMPLE OUTPUTS

Q1: First Screen -> Second Screen
Q2: Home Screen -> About Screen
Q3: Home, Profile and Settings
Q4: Login -> Home Screen
Q5: Home -> Profile Screen
Q6: Second Screen opens using Navigator.push()
Q7: Back button returns using Navigator.pop()
Q8: Forward and backward navigation
Q9: Bottom navigation: Home, Profile, Settings
Q10: Switch between three screens
Q11: Drawer: Home, Profile, About, Settings
Q12: Open screens from Navigation Drawer
Q13: Drawer items with icons and text
Q14: Home, Courses and Contact
Q15: Student Profile, Attendance and Result
Q16: Student Name: Puja
Q17: Name: Puja, Course: BCA
Q18: Student Name displayed on new screen
Q19: 10 + 20 = 30
Q20: Product: Notebook, Price: Rs. 499
Q21: Selected student's details
Q22: Login and navigate to Home/Profile
Q23: College app navigation
Q24: Shopping app navigation
Q25: Student Profile, Attendance and Result
*/
