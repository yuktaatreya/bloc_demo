abstract class LoginState {
  late String? language;
  late String email;

}
class InitialState extends LoginState{
   @override
   String? get language => null;
}

class LanguageSelectedState extends LoginState{
  final String _language ;
  LanguageSelectedState(this._language);
  @override
  String? get language => _language;
}

class LoginScreenLoadingState extends LoginState {
  final String _language;
  LoginScreenLoadingState(this._language);
  @override
  String? get language => _language;
}

class LoginSuccessfulState extends LoginState {
  final String _email;
  LoginSuccessfulState(this._email);
  @override
  String get email=> _email;
}