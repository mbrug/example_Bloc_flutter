import 'package:equatable/equatable.dart';
import '../models/employee.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Employee> get props => [];
}

class EmployeeUninitialized extends EmployeeState {
  List<Employee> employeeList;

  EmployeeUninitialized(){
    employeeList  = [
    Employee(1, "michael", 4000.0),
    Employee(2, "Javier", 4000.0),
    Employee(3, "Pochet", 4000.0),
    Employee(4, "Yoiler", 4000.0),
  ];
  }
  
  @override
  List<Employee> get props => employeeList;
}

class EmployeeLoaded extends EmployeeState {
  final List<Employee> employeeList;

  const EmployeeLoaded(this.employeeList);

  @override
  List<Employee> get props => employeeList;

  @override
  String toString() => 'EmployeeList { employee: $employeeList }';
}
