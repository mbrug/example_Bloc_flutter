import 'package:equatable/equatable.dart';
import '../models/employee.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeLoadSuccess extends EmployeeEvent {}

class EmpoyeeIncrement extends EmployeeEvent {
  final Employee employee;

  const EmpoyeeIncrement(this.employee);

  @override
  List<Object> get props => [employee];

  @override
  String toString() => 'TodoIncrement { todo: $employee }';
}

class EmpoyeeDecrement extends EmployeeEvent {
  final Employee _employee;

  const EmpoyeeDecrement(this._employee);

  Employee get employee => _employee;

  @override
  List<Object> get props => [_employee];

  @override
  String toString() => 'TodoDecrement { todo: $_employee }';
}
