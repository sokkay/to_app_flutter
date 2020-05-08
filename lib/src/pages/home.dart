import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/blocs/to_do_bloc.dart';
import 'package:to_do/src/model/to_do.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoBloc = Provider.of<ToDoBloc>(context);
    todoBloc.getAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: StreamBuilder<List<ToDo>>(
        stream: todoBloc.todoStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final datos = snapshot.data;

            return ListView.builder(
              itemCount: datos.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  title: Text(datos[i].title),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
