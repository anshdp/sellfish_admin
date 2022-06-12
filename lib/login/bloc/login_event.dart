part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// ignore: must_be_immutable
class LoginWithEmailAndPassword extends LoginEvent {
  LoginWithEmailAndPassword({required this.email, required this.password});
  String email;
  String password;
}

class InvalidEmailOrPassword extends LoginEvent {}
