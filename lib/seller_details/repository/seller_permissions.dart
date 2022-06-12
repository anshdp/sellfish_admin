import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sellfish/constants/db_collection_constants.dart';
import 'package:sellfish/constants/db_field_constants.dart';
import 'package:sellfish/seller_details/bloc/permission_bloc.dart';

final users = FirebaseFirestore.instance.collection(userCollection);

class SellerPermission {
  Future<bool> setPermission(SetPermissionEvent event) async {
    if (event.currentStatus == false) {
      await users.doc(event.userId).update({permissionField: true});
      return true;
    } else {
      await users.doc(event.userId).update({permissionField: false});
      return true;
    }
  }
}
