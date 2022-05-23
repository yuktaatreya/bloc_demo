import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen/bloc/login_screen_bloc.dart';
import 'login_screen/bloc/login_screen_events.dart';
import 'login_screen/bloc/login_screen_states.dart';
import 'login_screen/login_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter Bloc Demo"),
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