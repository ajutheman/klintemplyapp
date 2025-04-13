// part of 'login_bloc.dart';
//
// abstract class LoginEvent {}
//
// class LoginButtonPressed extends LoginEvent {
//   final String email;
//   final String password;
//
//   LoginButtonPressed(this.email, this.password);
// }

part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final String fcmToken;

  LoginButtonPressed(this.email, this.password, this.fcmToken);
}
