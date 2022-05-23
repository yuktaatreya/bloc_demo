import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/second_screen/bloc/login_screen_bloc.dart';
import 'package:untitled/second_screen/bloc/login_screen_events.dart';
import 'package:untitled/second_screen/bloc/login_screen_states.dart';
import 'package:untitled/second_screen/login_screen.dart';

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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Navigate to Login Screen',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              BlocProvider.of<LoginBloc>(context).add(SelectLanguageEvent("English"));
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>const LoginScreen()));

            },
            child: const Icon(Icons.arrow_forward_ios),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
    );
  }
}
