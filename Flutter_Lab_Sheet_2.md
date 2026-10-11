
BASIC FLUTTER WIDGETS AND USER INTERFACE DESIGN
Q1. Display "Hello Flutter"
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(body: Center(child: Text('Hello Flutter')))
  ));
Q2. Display name, course, semester and college
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: Puja Chauhan'),
          Text('Course: BCA'),
          Text('Semester: 5'),
          Text('College: COER University'),
        ],
      ),
    ),
  ),
));
Output: Name, course, semester and college appear as four lines.
Q3. Demonstrate text styles
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Italic Text', style: TextStyle(fontStyle: FontStyle.italic)),
          Text('Large Text', style: TextStyle(fontSize: 28)),
          Text('Centered Text', textAlign: TextAlign.center),
        ],
      ),
    ),
  ),
));
Output: Text examples appear in bold, italic, large and centered styles.
Q4. Display an image using Image widget
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Image(
        image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        ),
        width: 200,
      ),
    ),
  ),
));
Output: An owl image appears (requires internet access).
Q5. Display different icons
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home, size: 40),
          Icon(Icons.star, size: 40),
          Icon(Icons.favorite, size: 40),
          Icon(Icons.school, size: 40),
        ],
      ),
    ),
  ),
));
Output: Home, star, heart and school icons appear in one row.
Q6. Display Text, Image and Icon together
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 50, color: Colors.blue),
          SizedBox(height: 12),
          Text('COER University', style: TextStyle(fontSize: 22)),
          SizedBox(height: 12),
          Image(
            image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
            width: 120,
          ),
        ],
      ),
    ),
  ),
));
Output: A school icon, college name and owl image appear vertically.
Q7. Use Container with height, width, padding, margin and decoration
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Container(
        height: 120,
        width: 220,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Flutter Container',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
));
Output: A blue rounded container displays white text.
Q8. Display multiple Text widgets horizontally using Row
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text('One'), Text('Two'), Text('Three')],
      ),
    ),
  ),
));
Output: One, Two and Three appear horizontally.
Q9. Display multiple Text widgets vertically using Column
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('One'), Text('Two'), Text('Three')],
      ),
    ),
  ),
));
Output: One, Two and Three appear vertically.
Q10. Create Submit, Reset and Cancel buttons
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ButtonScreen()));

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Submit')),
          ElevatedButton(onPressed: () {}, child: Text('Reset')),
          ElevatedButton(onPressed: () {}, child: Text('Cancel')),
        ],
      ),
    ),
  );
}
Output: Submit, Reset and Cancel buttons appear. Their actions are placeholders.
Q11. Student profile card
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 35, child: Icon(Icons.person, size: 40)),
              SizedBox(height: 10),
              Text('Puja Chauhan', style: TextStyle(fontSize: 22)),
              Text('BCA Student'),
              Icon(Icons.school),
            ],
          ),
        ),
      ),
    ),
  ),
));
Output: A card displays an avatar, student name, course and school icon.
Q12. Design a business card
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: BusinessCard()));

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 40, child: Icon(Icons.person, size: 45)),
              Text('Puja Chauhan', style: TextStyle(fontSize: 22)),
              Text('Phone: 9876543210'),
              Text('Email: puja@example.com'),
            ],
          ),
        ),
      ),
    ),
  );
}
Output: A business card shows a profile icon, name, phone number and email.
Q13. Design a simple login screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: LoginScreen()));

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Login')),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(Icons.account_circle, size: 80),
          TextField(decoration: InputDecoration(labelText: 'Username')),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Login')),
        ],
      ),
    ),
  );
}
Output: Login screen with an icon, username field, password field and Login button.
Q14. Design a registration screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RegistrationScreen()));

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Registration')),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Name')),
          TextField(decoration: InputDecoration(labelText: 'Email')),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Register')),
        ],
      ),
    ),
  );
}
Output: Registration screen with Name, Email and Password fields and a Register button.
Q15. Design a college home screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CollegeHome()));

class CollegeHome extends StatelessWidget {
  const CollegeHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('COER University')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 90, color: Colors.blue),
          Text('COER University', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('About College')),
          ElevatedButton(onPressed: () {}, child: Text('Courses')),
          ElevatedButton(onPressed: () {}, child: Text('Contact')),
        ],
      ),
    ),
  );
}
Output: College name, school icon and About College, Courses and Contact buttons appear.
Q16. Display multiple products using Container and Card
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ProductList()));

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Products')),
    body: ListView(
      children: [
        productCard('Laptop', '₹45000', Icons.laptop),
        productCard('Mobile', '₹15000', Icons.phone_android),
        productCard('Headphones', '₹2000', Icons.headphones),
      ],
    ),
  );

  Widget productCard(String name, String price, IconData icon) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(icon, size: 40),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(name), Text(price)],
            ),
          ],
        ),
      ),
    );
  }
}
Output: Three product cards show Laptop, Mobile and Headphones with sample prices.
Q17. Display student information using Card
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Puja Chauhan'),
              Text('Roll Number: 101'),
              Text('Course: BCA'),
              Text('Semester: 5'),
            ],
          ),
        ),
      ),
    ),
  ),
));
Output: A card shows student name, roll number, course and semester.
Q18. Demonstrate Padding and Margin
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(25),
        color: Colors.orange,
        child: Text('Padding inside; margin outside'),
      ),
    ),
  ),
));
Output: Text appears inside an orange container. Padding creates inner space; margin creates outer space.
Q19. Demonstrate Center and Align widgets
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Top Left'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text('Top Right'),
          ),
          Center(child: Text('Center')),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text('Bottom Center'),
          ),
        ],
      ),
    ),
  ),
));
Output: Labels appear at the top-left, top-right, center and bottom-center positions.
Q20. Design a simple food menu screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FoodMenu()));

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Food Menu')),
    body: ListView(
      children: [
        foodItem('Pizza', '₹199', Icons.local_pizza),
        foodItem('Burger', '₹99', Icons.lunch_dining),
        foodItem('Ice Cream', '₹60', Icons.icecream),
      ],
    ),
  );

  Widget foodItem(String name, String price, IconData icon) => Card(
    child: ListTile(
      leading: Icon(icon, size: 35),
      title: Text(name),
      subtitle: Text(price),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text('Order'),
      ),
    ),
  );
}
Output: Food menu with Pizza, Burger and Ice Cream, sample prices, icons and Order buttons.
Q21. Design a simple calculator interface
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Calculator()));

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Calculator')),
    body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text('0', style: TextStyle(fontSize: 36)),
        ),
        for (final row in [
          ['7', '8', '9', '/'],
          ['4', '5', '6', '*'],
          ['1', '2', '3', '-'],
          ['0', 'C', '=', '+'],
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final key in row)
                Padding(
                  padding: EdgeInsets.all(6),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(key),
                  ),
                ),
            ],
          ),
      ],
    ),
  );
}
Output: A calculator-style screen with a display and number/operator buttons. Buttons are for interface demonstration and do not calculate.
Q22. Design a weather information screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: WeatherScreen()));

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Weather')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Roorkee', style: TextStyle(fontSize: 28)),
          Icon(Icons.wb_sunny, size: 90, color: Colors.orange),
          Text('28°C', style: TextStyle(fontSize: 40)),
          Text('Sunny'),
          Text('Humidity: 45%'),
          Text('Wind: 10 km/h'),
        ],
      ),
    ),
  );
}
Output: Sample weather screen for Roorkee showing 28°C, sunny, humidity and wind. Values are illustrative, not live weather.
Q23. Design a shopping product screen
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ShoppingProduct()));

class ShoppingProduct extends StatelessWidget {
  const ShoppingProduct({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Shopping')),
    body: Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.headphones, size: 100, color: Colors.blue),
              Text('Wireless Headphones',
                  style: TextStyle(fontSize: 22)),
              Text('Price: ₹1,999'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text('4.5 rating'),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Output: Product card with image-like icon, name, sample price, rating and Add to Cart button.
Q24. Design a student dashboard
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StudentDashboard()));

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Student Dashboard')),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Puja Chauhan'),
            subtitle: Text('BCA Student'),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                dashboardCard('Profile', Icons.person),
                dashboardCard('Attendance', Icons.calendar_month),
                dashboardCard('Results', Icons.grade),
                dashboardCard('Settings', Icons.settings),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget dashboardCard(String title, IconData icon) => Card(
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 35), Text(title)],
      ),
    ),
  );
}
Output: Student profile and four dashboard cards: Profile, Attendance, Results and Settings.
Q25. Create a personal profile/home screen using multiple widgets
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PersonalHome()));

class PersonalHome extends StatelessWidget {
  const PersonalHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('My Profile')),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 55),
            ),
            SizedBox(height: 12),
            Text('Puja Chauhan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('BCA Student | COER University'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 10),
                    Text('Interested in Programming'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Text('Skills: Dart, Flutter, Python'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Contact Me'),
            ),
          ],
        ),
      ),
    ),
  );
}
Output: A personal home screen with profile avatar, name, course, programming interest, skills card and Contact Me button.

