import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login_screen/bloc/login_screen_events.dart';
import 'package:untitled/login_screen/bloc/login_screen_states.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc(LoginState initialState) : super(InitialState()){
    on<SelectLanguageEvent>((event,emit){
      emit(LanguageSelectedState(event.language));
    });
    on<UserLoginEvent>((event,emit){
      emit(LoginSuccessfulState(event.email,event.language));
    });
  }

}