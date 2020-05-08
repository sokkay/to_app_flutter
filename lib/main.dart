import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/src/blocs/to_do_bloc.dart';
import 'package:to_do/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ToDoBloc>(
          create: (_) => ToDoBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {"/": (BuildContext context) => HomePage()},
      ),
    );
  }
}
