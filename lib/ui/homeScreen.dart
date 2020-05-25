import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_friend/bloc/employeeEvent.dart';
import 'package:flutter_friend/bloc/employeeState.dart';
import '../models/employee.dart';
import '../models/employee.dart';
import '../bloc/employeeBloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeeBloc counterBloc = BlocProvider.of<EmployeeBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.props.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${state.props[index].id}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${state.props[index].nombre}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "${state.props[index].salario}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.blueAccent,
                          onPressed: () {
                            counterBloc.add(EmpoyeeIncrement(state.props[index]));
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.redAccent,
                          onPressed: () {counterBloc.add(EmpoyeeDecrement(state.props[index]));},
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                
              },
            ),
          ),
        ],
      ),
    );
  }
}
