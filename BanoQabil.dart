import 'dart:io';
import 'dart:math';

void main() {
  //Calculate Area of triangle.
  double b, h, a;
  print('Enter the height of the "Triangle"');
  h = double.parse(stdin.readLineSync()!);

  print('Enter the base of the "Triangle"');
  b = double.parse(stdin.readLineSync()!);

  a = (b * h) / 2;

  print("The area of the Triangle is $a");

  //Calculate Average of two number.
  double c, d, e;
  print('Enter Fisrt Number');
  c = double.parse(stdin.readLineSync()!);
  print('Enter Second Number');
  d = double.parse(stdin.readLineSync()!);
  e = (c + d) / 2;
  print("The Average is: $e");

  //Calculate volume and surface area of sphere.

  double r, v, s;
  print("Enter the radius of the Sphere");
  r = double.parse(stdin.readLineSync()!);
  v = (4 / 3) * pi * pow(r, 3);
  s = 4 * pi * pow(r, 2);
  print("The volume of the Sphere is $v");
  print("The surface area of the sphere is $s");

  // calculates the result of raising the base to the exponent.
  double n, x, l;
  print("Enter Any Number:");
  n = double.parse(stdin.readLineSync()!);
  print("Enter Exponent number:");
  x = double.parse(stdin.readLineSync()!);

  l = n;
  for (int i = 1; i < x; i++) {
    n = n * l;
  }
  print("The answer of $l ^ $x is: $n");

  //Convert Celsius into Fahrenheit
  double celsius, Farh;
  print("Enter Temperature in Celsius: ");
  celsius = double.parse(stdin.readLineSync()!);
  Farh = (9 / 5) * celsius + 32;
  print("The conversion of Celsius to Fahrenheit is: $Farh");

  //Identify Prime Numbers
  int num;
  bool prime = true;
  print("Enter a Positive Integer: ");
  num = int.parse(stdin.readLineSync()!);
  if (num < 1) {
    prime = false;
  } else {
    for (int i = 2; i <= num / 2; i++) {
      if (num % i == 0) {
        prime = false;
        break;
      }
    }
  }

  if (prime) {
    print("$num is a prime number");
  } else {
    print("$num is not a prime number");
  }
}
