import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_friend/bloc/employeeEvent.dart';
import 'package:flutter_friend/bloc/employeeState.dart';
import '../models/employee.dart';

enum CounterEvent { increment, decrement }

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
// class EmployeeBloc extends Bloc<CounterEvent, int> {
  @override
  EmployeeState get initialState => EmployeeUninitialized();

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
    final currentState = state;
    print('mapEventToState  $event, ${currentState}');

    if (event is EmpoyeeIncrement) {
      double salarioActual = event.employee.salario;
      double salarioIncrement = salarioActual * 20 / 100;
      currentState.props[event.employee.id - 1].salario = salarioActual + salarioIncrement;
      yield EmployeeLoaded(currentState.props);
      // yield* _mapIncrementToState(event);
    } else if (event is EmpoyeeDecrement) {
      // yield EmployeeLoaded(event.list);
    }
  }

  Stream<EmployeeState> _mapIncrementToState(EmpoyeeIncrement event) async* {
    print('_mapIncrementToState1 $event, $state ');
    // if (state is TodosLoadSuccess) {
    // final List<EmployeeState> updatedTodos = List.from((state as EmployeeLoaded).employeeList);
    // print('mas $updatedTodos');
    //   yield TodosLoadSuccess(updatedTodos);
    //   _saveTodos(updatedTodos);
    // }
  }

  Stream<EmployeeState> _mapDecrementToState(EmpoyeeDecrement event) async* {
    print('_mapIncrementToState2 $event, $state');
    // if (state is TodosLoadSuccess) {
    //   final List<Todo> updatedTodos =
    //       List.from((state as TodosLoadSuccess).todos)..add(event.todo);
    //   yield TodosLoadSuccess(updatedTodos);
    //   _saveTodos(updatedTodos);
    // }
  }
}
