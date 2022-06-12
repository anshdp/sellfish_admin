import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sellfish/seller_details/repository/seller_permissions.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial()) {
    on<PermissionEvent>((event, emit) async {
      if (event is SetPermissionEvent) {
        await SellerPermission().setPermission(event);
      }
    });
  }
}
