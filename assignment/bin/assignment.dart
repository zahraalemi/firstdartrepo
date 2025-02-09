import 'dart:io';

class Person {
  String name;
  String personalNumber;

  Person(this.name, this.personalNumber);
}

class Vehicle {
  String registrationNumber;
  String type;
  Person owner;

  Vehicle(this.registrationNumber, this.type, this.owner);
}

class ParkingSpace {
  int id;
  String address;
  double pricePerHour;

  ParkingSpace(this.id, this.address, this.pricePerHour);
}

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime? endTime;

  Parking(this.vehicle, this.parkingSpace, this.startTime, [this.endTime]);
}

// Classes
class Repository<T> {
  List<T> items = [];

  void add(T item) => items.add(item);
  List<T> getAll() => items;
  void delete(T item) => items.remove(item);
}

class PersonRepository extends Repository<Person> {}

class VehicleRepository extends Repository<Vehicle> {}

class ParkingSpaceRepository extends Repository<ParkingSpace> {}

class ParkingRepository extends Repository<Parking> {}

// CLI
void main() {
  var personRepo = PersonRepository();
  var vehicleRepo = VehicleRepository();
  var parkingSpaceRepo = ParkingSpaceRepository();
  var parkingRepo = ParkingRepository();

  while (true) {
    print("\n Welcome to the parking app!");
    print("What do you want to manage?");
    print("1. People");
    print("2. Vehicle");
    print("3. Parking Space");
    print("4. Parking Lots");
    print("5. Exit");
    stdout.write("Select an option(1-5): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _managePersons(personRepo);
        break;
      case '2':
        _manageVehicles(vehicleRepo);
        break;
      case '3':
        _manageParkingSpaces(parkingSpaceRepo);
        break;
      case '4':
        _manageParking(parkingRepo);
        break;
      case '5':
        exit(0);
      default:
        print("Invalid option! Try again.");
    }
  }
}

void _managePersons(PersonRepository repo) {
  print("You have chosen to manage People. What do you want to do?");
  print("1. Add new person");
  print("2. Show all people");
  print("3. Update person");
  print("4. Delete person");
  print("5. Return to main menu");
  stdout.write("Choose an option (1-5): ");
  var choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write("Name: ");
      var name = stdin.readLineSync() ?? "";
      stdout.write("Personnummer: ");
      var personalNumber = stdin.readLineSync() ?? "";
      repo.add(Person(name, personalNumber));
      print("Person added.");
      break;
    case '2':
      repo.getAll().forEach((p) => print("${p.name} - ${p.personalNumber}"));
      break;
    case '3':
      stdout.write("Name of person to update: ");
      var name = stdin.readLineSync();
      var person = repo.items
          .firstWhere((p) => p.name == name, orElse: () => Person("", ""));
      if (person.name.isEmpty) {
        print("Person not found.");
        break;
      }
      stdout.write("New name: ");
      person.name = stdin.readLineSync() ?? person.name;
      stdout.write("New Personnummer : ");
      person.personalNumber = stdin.readLineSync() ?? person.personalNumber;
      print("Person updated.");
      break;
    case '4':
      stdout.write("Name of the person to delete: ");
      var name = stdin.readLineSync();
      repo.items.removeWhere((p) => p.name == name);
      print("Person deleted..");
      break;
    case '5':
      return;
    default:
      print("Invalid option!");
  }
}

void _manageVehicles(VehicleRepository repo) {
  print("Vehicle Management");
}

void _manageParkingSpaces(ParkingSpaceRepository repo) {
  print("Manage parking spaces");
}

void _manageParking(ParkingRepository repo) {
  print("Parking lot management");
}
