//Create a Vehicle class with brand, model, and year properties, and a method called drive() that prints a message indicating that the vehicle is being driven. Then create a Car class that inherits from Vehicle and has a numDoors property. Override the drive() method in the Car class to print a message that includes the number of doors.
//Vehicle
class Vehicle {
  String brand = "";
  String model = "";
  String year = "";
  Vehicle(this.brand, this.model, this.year);
  void drive() {
    print("Indicating that the vehicle is being driven");
  }
}

class Car extends Vehicle {
  int numDoors = 0;
  Car(String brand, String model, String year, this.numDoors) : super(brand, model, year);
  void drive() {
    print("The $year $brand $model with $numDoors doors was a classic Car.");
  }
}

//Create a BankAccount class with balance and accountNumber properties, and methods called deposit() and withdraw() that modify the balance property. Then create a CheckingAccount class that inherits from BankAccount and has a transactionLimit property. Override the withdraw() method in the CheckingAccount class to check if the withdrawal amount is within the transaction limit before modifying the balance property.
//Bank
class BankAccount {
  double balance = 0;
  String Account_Number = "";
  BankAccount(this.balance, this.Account_Number);
  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    balance -= amount;
  }
}

class CheckingAccount extends BankAccount {
  double transaction_limit = 0;
  CheckingAccount(double balance, String Account_Number, this.transaction_limit)
      : super(balance, Account_Number);
  void withdraw(double amount) {
    if (amount > transaction_limit) {
      print("Withdrawal amount execeeds transaction limit!");
    } else {
      balance -= amount;
      print("Amount of $amount dollar successfully withdrawed!");
    }
  }
}

//Create a Person class with firstName and lastName properties, and a method called fullName() that returns the full name of the person. Then create a Student class that inherits from Person and has a major property. Override the fullName() method in the Student class to include the major in the full name.
//Person
class Person {
  String firstname = "";
  String lastname = "";
  Person(this.firstname, this.lastname);
  String fullname() {
    return firstname + " " + lastname;
  }
}

class Student extends Person {
  String major;
  Student(String firstname, String lastname, this.major)
      : super(firstname, lastname);
  String fullname() {
    return "${super.fullname()} ($major)";
  }
}

void main() {
  //Vehicle
  print("Vehicle class");
  Car v1 = Car("Honda Accord", "VTi 2.4", "2018", 4);
  v1.drive();

  //Bank Account
  print("\n\nBank class");
  CheckingAccount Account = CheckingAccount(10000, "1235345324234", 2000);
  print("Balance before deposit: " + Account.balance.toString());
  Account.deposit(1000);
  print("Balance after deposit: " + Account.balance.toString());
  Account.withdraw(4000);
  Account.withdraw(2000);
  print("\n\nPerson class");
  //Student
  Student s1 = Student("Kumail", "Abbas", "Computer Science");
  print(s1.fullname());
}
