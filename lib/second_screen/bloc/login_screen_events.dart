abstract class LoginEvent {}

class SelectLanguageEvent extends LoginEvent{
  final String language;
  SelectLanguageEvent(this.language);
}
class UserLoginEvent extends LoginEvent{
  final String email;
  final String password;
  UserLoginEvent(this.email,this.password);
}