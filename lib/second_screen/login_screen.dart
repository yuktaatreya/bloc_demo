import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/second_screen/bloc/login_screen_bloc.dart';
import 'package:untitled/second_screen/bloc/login_screen_events.dart';
import 'package:untitled/second_screen/bloc/login_screen_states.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool isObscureText=true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children:[
              Text('Welcome Back,'),
              Text('Sign in to continue'),
              Form(
                key: _formKey,
               child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email Address'
                    ),
                    onChanged: (val){
                      email=val;
                    },
                    validator: (val){
                      if(val==null || val!.isEmpty)
                        return "Please Enter email";
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    onChanged: (val){
                      password=val;
                    },
                    validator: (val){
                      if(val==null || val!.isEmpty)
                        return "Please Enter password";
                    },
                  )
                ],
              ),
              ),
              Text('Forgot password?'),
              ElevatedButton(onPressed: (){
               if(_formKey.currentState!.validate())
                 {
                   BlocProvider.of<LoginBloc>(context).add(
                       UserLoginEvent(email, password));
                 }
              },
                  child:Text("Sign in") ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'For New User , '),
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Navigate to Sign Up page');
                        }),
                ],
              ),
            )

            ]

          ),
        );
      }
    );
  }
}
