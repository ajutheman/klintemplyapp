part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final EmployeeModel employee;
  ProfileLoaded(this.employee);
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}
