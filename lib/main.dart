import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login_screen/bloc/login_screen_bloc.dart';
import 'package:untitled/login_screen/bloc/login_screen_events.dart';
import 'package:untitled/login_screen/bloc/login_screen_states.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context)=>LoginBloc(InitialState()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 36.0,color: Colors.black),
            subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            bodyText1: TextStyle(fontSize: 14)
          )
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

