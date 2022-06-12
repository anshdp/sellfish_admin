part of 'permission_bloc.dart';

@immutable
abstract class PermissionState {}

class PermissionInitial extends PermissionState {}

class PermissionAcceptedState extends PermissionState {}

class PermissionRemovedState extends PermissionState {}
