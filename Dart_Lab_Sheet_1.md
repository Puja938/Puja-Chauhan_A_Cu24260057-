DART PROGRAMMING BASICs 
Q1. Display name, course, college and semester
void main() {
  print("Name: Puja Chauhan");
  print("Course: BCA");
  print("College: COER University");
  print("Semester: 5");
}
Output
Name: Puja Chauhan
Course: BCA
College: COER University
Semester: 5
Q2. Variables of different data types
void main() {
  int age = 20;
  double marks = 85.5;
  String name = "Puja";
  bool isStudent = true;

  print(age);
  print(marks);
  print(name);
  print(isStudent);
}
Output
20
85.5
Puja
true
Q3. Demonstrate var, final and const
void main() {
  var name = "Puja";
  final age = 20;
  const pi = 3.14;

  print(name);
  print(age);
  print(pi);
}
Output
Puja
20
3.14
Q4. Sum, difference, product and quotient
void main() {
  int a = 20, b = 5;

  print("Sum: ${a + b}");
  print("Difference: ${a - b}");
  print("Product: ${a * b}");
  print("Quotient: ${a / b}");
}
Output
Sum: 25
Difference: 15
Product: 100
Quotient: 4.0
Q5. Area and perimeter of a rectangle
void main() {
  double length = 10, width = 5;

  print("Area: ${length * width}");
  print("Perimeter: ${2 * (length + width)}");
}
Output
Area: 50.0
Perimeter: 30.0
Q6. Area of a circle
void main() {
  double radius = 7;
  double area = 3.14 * radius * radius;

  print("Area of circle: $area");
}
Output
Area of circle: 153.86
Q7. Convert Celsius to Fahrenheit
void main() {
  double celsius = 25;
  double fahrenheit = (celsius * 9 / 5) + 32;

  print("Fahrenheit: $fahrenheit");
}
Output
Fahrenheit: 77.0
Q8. Swap two variables
void main() {
  int a = 10, b = 20;

  int temp = a;
  a = b;
  b = temp;

  print("a: $a");
  print("b: $b");
}
Output
a: 20
b: 10
Q9. Check whether a number is positive, negative or zero
void main() {
  int number = -5;

  if (number > 0) {
    print("Positive");
  } else if (number < 0) {
    print("Negative");
  } else {
    print("Zero");
  }
}
Output
Negative
Q10. Check whether a number is even or odd
void main() {
  int number = 7;

  if (number % 2 == 0) {
    print("Even");
  } else {
    print("Odd");
  }
}
Output
Odd
Q11. Find the largest of two numbers
void main() {
  int a = 15, b = 25;

  if (a > b) {
    print("$a is largest");
  } else {
    print("$b is largest");
  }
}
Output
25 is largest
Q12. Find the largest of three numbers
void main() {
  int a = 10, b = 30, c = 20;

  if (a >= b && a >= c) {
    print("Largest: $a");
  } else if (b >= a && b >= c) {
    print("Largest: $b");
  } else {
    print("Largest: $c");
  }
}
Output
Largest: 30
Q13. Check whether a year is a leap year
void main() {
  int year = 2024;

  if (year % 400 == 0 ||
      (year % 4 == 0 && year % 100 != 0)) {
    print("Leap year");
  } else {
    print("Not a leap year");
  }
}
Output
Leap year
Q14. Calculate grade based on percentage
void main() {
  double percentage = 85;

  if (percentage >= 90) {
    print("Grade: A+");
  } else if (percentage >= 80) {
    print("Grade: A");
  } else if (percentage >= 70) {
    print("Grade: B");
  } else if (percentage >= 60) {
    print("Grade: C");
  } else if (percentage >= 40) {
    print("Grade: D");
  } else {
    print("Fail");
  }
}
Output
Grade: A
Q15. Print numbers from 1 to 10 using a for loop
void main() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}
Output
1
2
3
4
5
6
7
8
9
10
Q16. Print even numbers between 1 and 50
void main() {
  for (int i = 2; i <= 50; i += 2) {
    print(i);
  }
}
Output
2
4
6
8
10
12
14
16
18
20
22
24
26
28
30
32
34
36
38
40
42
44
46
48
50
Q17. Calculate the sum of the first 10 natural numbers
void main() {
  int sum = 0;

  for (int i = 1; i <= 10; i++) {
    sum += i;
  }

  print("Sum: $sum");
}
Output
Sum: 55
Q18. Generate the multiplication table of a number
void main() {
  int number = 5;

  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }
}
Output
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
Q19. Calculate the factorial of a number
void main() {
  int number = 5;
  int factorial = 1;

  for (int i = 1; i <= number; i++) {
    factorial *= i;
  }

  print("Factorial: $factorial");
}
Output
Factorial: 120
Q20. Reverse a number using a loop
void main() {
  int number = 1234;
  int reverse = 0;

  while (number > 0) {
    int digit = number % 10;
    reverse = reverse * 10 + digit;
    number ~/= 10;
  }

  print("Reverse: $reverse");
}
Output
Reverse: 4321
Q21. Function that accepts two numbers and returns their sum
int sum(int a, int b) {
  return a + b;
}

void main() {
  print("Sum: ${sum(10, 20)}");
}
Output
Sum: 30
Q22. Function to check whether a number is prime
bool isPrime(int number) {
  if (number < 2) return false;

  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }

  return true;
}

void main() {
  int number = 7;

  if (isPrime(number)) {
    print("Prime number");
  } else {
    print("Not a prime number");
  }
}
Output
Prime number
Q23. Create a list of five student names and display each name
void main() {
  List<String> students = [
    "Puja", "Rahul", "Nidhi", "Palak", "Abdul"
  ];

  for (String name in students) {
    print(name);
  }
}
Output
Puja
Rahul
Nidhi
Palak
Abdul
Q24. Find the largest and smallest number in a list
void main() {
  List<int> numbers = [12, 5, 30, 8, 20];

  int largest = numbers[0];
  int smallest = numbers[0];

  for (int number in numbers) {
    if (number > largest) largest = number;
    if (number < smallest) smallest = number;
  }

  print("Largest: $largest");
  print("Smallest: $smallest");
}
Output
Largest: 30
Smallest: 5
Q25. Student result program
void main() {
  String name = "Puja";
  int subject1 = 80;
  int subject2 = 75;
  int subject3 = 90;

  int total = subject1 + subject2 + subject3;
  double percentage = total / 3;

  print("Name: $name");
  print("Total Marks: $total");
  print("Percentage: ${percentage.toStringAsFixed(2)}%");

  if (subject1 >= 33 &&
      subject2 >= 33 &&
      subject3 >= 33) {
    print("Result: Pass");
  } else {
    print("Result: Fail");
  }
}
Output
Name: Puja
Total Marks: 245
Percentage: 81.67%
Result: Pass
