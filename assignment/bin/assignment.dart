import 'dart:io';

void main(List<String> arguments) {

  final regNr = prompt('Type something: ');
if(regNr != null){
  var newVehicle = Vehicle(regNr: regNr);
  print ("new vehicle: ${newVehicle.regNr}");
}
}

String? prompt(String value){
   stdout.write(value);
  final input = stdin.readLineSync();
  return input;
}
class Vehicle{
  final String regNr;
  Vehicle({required this.regNr});
}