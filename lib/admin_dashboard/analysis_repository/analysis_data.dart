import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sellfish/constants/db_collection_constants.dart';

class AnalysisAppData {
  Future<int> getUsers(bool type) async {
    final QuerySnapshot totalUsers = await FirebaseFirestore.instance
        .collection(userCollection)
        .where('userType', isEqualTo: type)
        .get();
    final usersCount = totalUsers.docs.length;
    return usersCount;
  }

  Future<int> sellerStatus(bool type) async {
    final QuerySnapshot sellerStatus = await FirebaseFirestore.instance
        .collection(userCollection)
        .where('userType', isEqualTo: true)
        .where('permission', isEqualTo: type)
        .get();
    final statusCount = sellerStatus.docs.length;
    print(statusCount);
    return statusCount;
  }

  Future<int> getProducts() async {
    final QuerySnapshot totalProducts =
        await FirebaseFirestore.instance.collection(productCollection).get();
    final productsCount = totalProducts.docs.length;
    return productsCount;
  }
}
