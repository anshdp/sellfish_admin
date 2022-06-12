part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent {}

class SetPermissionEvent extends PermissionEvent {
  SetPermissionEvent({
    required this.userId,
    required this.currentStatus,
  });
  String userId;
  bool currentStatus;
}

class PermissionRemoveEvent extends PermissionEvent {
  PermissionRemoveEvent({required this.userId});
  String userId;
}
