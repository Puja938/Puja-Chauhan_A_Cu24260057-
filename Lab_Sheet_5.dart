
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
      title: 'Flutter Lab Sheet 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> programs = const [
    '1. ListView - Five Items',
    '2. ListTile - Icon and Subtitle',
    '3. ListView.builder - Numbers 1 to 100',
    '4. List of Names',
    '5. ListView.separated',
    '6. Horizontal List',
    '7. GridView.count - Icons',
    '8. GridView.builder - Colored Boxes',
    '9. Product List with Model Class',
    '10. StatelessWidget and StatefulWidget',
    '11. Counter using setState',
    '12. Increment, Decrement and Reset',
    '13. Add Item to List',
    '14. Delete Item from List',
    '15. Dismissible List',
    '16. Search Names',
    '17. Student Record Application',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab Sheet 5')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(programs[index]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProgramPage(number: index + 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Product model class
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

// Student model class
class Student {
  final String name;
  final String roll;
  final String course;

  Student(this.name, this.roll, this.course);
}

class ProgramPage extends StatefulWidget {
  final int number;

  const ProgramPage({super.key, required this.number});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  int counter = 0;

  final List<String> items = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grapes',
  ];

  final List<String> names = [
    'Puja',
    'Rahul',
    'Nidhi',
    'Palak',
    'Abdul',
  ];

  final List<Product> products = [
    Product('Notebook', 50),
    Product('Pen', 10),
    Product('Bag', 500),
    Product('Bottle', 150),
  ];

  final List<Student> students = [
    Student('Puja', '101', 'BCA'),
    Student('Rahul', '102', 'BCA'),
  ];

  final TextEditingController inputController =
      TextEditingController();
  final TextEditingController rollController =
      TextEditingController();
  final TextEditingController courseController =
      TextEditingController();
  final TextEditingController searchController =
      TextEditingController();

  String searchText = '';

  @override
  void dispose() {
    inputController.dispose();
    rollController.dispose();
    courseController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Widget makeList(List<String> data) {
    return ListView(
      children: data
          .map((item) => ListTile(
                leading: const Icon(Icons.star),
                title: Text(item),
              ))
          .toList(),
    );
  }

  Widget counterButtons() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter',
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => setState(() => counter++),
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => counter--),
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => counter = 0),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addDeleteList({bool swipe = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(
                    labelText: 'Enter item',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle,
                    color: Colors.blue, size: 32),
                onPressed: () {
                  final value = inputController.text.trim();
                  if (value.isNotEmpty) {
                    setState(() {
                      items.add(value);
                      inputController.clear();
                    });
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final tile = ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() => items.removeAt(index));
                  },
                ),
              );

              if (!swipe) return tile;

              return Dismissible(
                key: ValueKey(items[index]),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  setState(() => items.removeAt(index));
                },
                child: tile,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget searchNames() {
    final filtered = names
        .where((name) =>
            name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search name',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() => searchText = value);
            },
          ),
        ),
        Expanded(child: makeList(filtered)),
      ],
    );
  }

  Widget studentRecords() {
    final filtered = students
        .where((student) => student.name
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: inputController,
                decoration:
                    const InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: rollController,
                decoration:
                    const InputDecoration(labelText: 'Roll Number'),
              ),
              TextField(
                controller: courseController,
                decoration:
                    const InputDecoration(labelText: 'Course'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  final name = inputController.text.trim();
                  final roll = rollController.text.trim();
                  final course = courseController.text.trim();

                  if (name.isEmpty ||
                      roll.isEmpty ||
                      course.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all fields'),
                      ),
                    );
                    return;
                  }

                  setState(() {
                    students.add(Student(name, roll, course));
                    inputController.clear();
                    rollController.clear();
                    courseController.clear();
                  });
                },
                child: const Text('Add Student'),
              ),
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by name',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() => searchText = value);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final student = filtered[index];

              return ListTile(
                leading: const CircleAvatar(
                    child: Icon(Icons.person)),
                title: Text(student.name),
                subtitle: Text(
                    'Roll: ${student.roll} | Course: ${student.course}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() => students.remove(student));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (widget.number) {
      case 1:
        page = makeList(items.take(5).toList());
        break;

      case 2:
        page = ListView(
          children: items.map((item) {
            return ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(item),
              subtitle: Text('This is $item'),
            );
          }).toList(),
        );
        break;

      case 3:
        page = ListView.builder(
          itemCount: 100,
          itemBuilder: (_, index) =>
              ListTile(title: Text('${index + 1}')),
        );
        break;

      case 4:
        page = ListView.builder(
          itemCount: names.length,
          itemBuilder: (_, index) =>
              ListTile(title: Text(names[index])),
        );
        break;

      case 5:
        page = ListView.separated(
          itemCount: items.length,
          itemBuilder: (_, index) =>
              ListTile(title: Text(items[index])),
          separatorBuilder: (_, __) => const Divider(),
        );
        break;

      case 6:
        page = ListView(
          scrollDirection: Axis.horizontal,
          children: items
              .map((item) => Container(
                    width: 150,
                    margin: const EdgeInsets.all(8),
                    color: Colors.blue.shade100,
                    alignment: Alignment.center,
                    child: Text(item),
                  ))
              .toList(),
        );
        break;

      case 7:
        page = GridView.count(
          crossAxisCount: 3,
          children: const [
            Icons.home,
            Icons.star,
            Icons.favorite,
            Icons.person,
            Icons.phone,
            Icons.settings,
            Icons.school,
            Icons.email,
            Icons.camera,
          ].map((icon) => Center(
                child: Icon(icon, size: 40, color: Colors.blue),
              )).toList(),
        );
        break;

      case 8:
        final colors = [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.orange,
          Colors.purple,
          Colors.teal,
          Colors.pink,
          Colors.amber,
        ];
        page = GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: colors.length,
          itemBuilder: (_, index) => Container(
            color: colors[index],
            child: Center(child: Text('${index + 1}')),
          ),
        );
        break;

      case 9:
        page = ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, index) {
            final product = products[index];
            return ListTile(
              leading: const Icon(Icons.inventory),
              title: Text(product.name),
              subtitle: Text('Price: ₹${product.price}'),
            );
          },
        );
        break;

      case 10:
        page = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('StatelessWidget: Fixed text'),
              Text('StatefulWidget: Counter = $counter'),
              ElevatedButton(
                onPressed: () => setState(() => counter++),
                child: const Text('Update Stateful Value'),
              ),
            ],
          ),
        );
        break;

      case 11:
      case 12:
        page = counterButtons();
        break;

      case 13:
        page = addDeleteList();
        break;

      case 14:
        page = addDeleteList();
        break;

      case 15:
        page = addDeleteList(swipe: true);
        break;

      case 16:
        page = searchNames();
        break;

      case 17:
        page = studentRecords();
        break;

      default:
        page = const Center(child: Text('Program not found'));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Program ${widget.number}')),
      body: page,
    );
  }
}

