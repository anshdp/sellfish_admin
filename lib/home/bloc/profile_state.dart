part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LogoutSuccess extends ProfileState {}

class LogoutFailed extends ProfileState {}
