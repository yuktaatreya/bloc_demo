import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen/bloc/login_screen_bloc.dart';
import 'login_screen/bloc/login_screen_events.dart';
import 'login_screen/bloc/login_screen_states.dart';
import 'login_screen/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

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