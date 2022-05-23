import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login_screen/bloc/login_screen_bloc.dart';
import 'package:untitled/login_screen/bloc/login_screen_events.dart';
import 'package:untitled/login_screen/bloc/login_screen_states.dart';
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
    return BlocConsumer<LoginBloc,LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessfulState) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Login successful !")));
        }
      },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              margin: const EdgeInsets.only(left: 20,top: 60,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text("Selected Language : ${state.language??"not selected"}"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Welcome Back,',style: Theme.of(context).textTheme.headline1,),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Sign in to continue',style: Theme.of(context).textTheme.subtitle1,),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          alignLabelWithHint: true,
                        ),
                        onChanged: (val){
                          email=val;
                        },
                        validator: (val){
                          if(val==null || val.isEmpty) {
                            return "Please Enter email";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: isObscureText,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        onChanged: (val){
                          password=val;
                        },
                        validator: (val){
                          if(val==null || val.isEmpty) {
                            return "Please Enter password";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                        style: Theme.of(context).textTheme.bodyText1,)),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(onPressed: (){
                     if(_formKey.currentState!.validate())
                       {
                         BlocProvider.of<LoginBloc>(context).add(
                             UserLoginEvent(email, password,state.language??'Not Selected'));
                       }
                    },
                        child:const Text("Sign in") ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'For New User , ',
                          style: Theme.of(context).textTheme.bodyText1
                        ),
                        TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: Colors.blue
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Navigate to Sign Up page');
                              }),
                      ],
                    ),
                  ),
                )

                ]

              ),
            ),
          );
        },
    );
  }
}
