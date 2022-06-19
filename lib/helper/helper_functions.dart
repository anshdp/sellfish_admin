import 'package:sellfish/constants/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLogin;
String? Id, emailId, name, adminType;

class HelperClass {
  Future getAdminData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    adminType = sharedPreferences.getString(typePref);
    isLogin = sharedPreferences.getBool(isLoggedInPref);
    Id = sharedPreferences.getString(adminIdPref);
    emailId = sharedPreferences.getString(emailPref);
    name = sharedPreferences.getString(userNamePref);
  }

  Future setAdminData(
    String adminId,
    String email,
    String userName,
    String type,
    bool isLogin,
    String phoneNo,
  ) async {
    final preference = await SharedPreferences.getInstance();

    await preference.setString(adminIdPref, adminId);

    await preference.setString(emailPref, email);

    await preference.setString(typePref, type);

    await preference.setString(userNamePref, userName);

    await preference.setBool(isLoggedInPref, isLogin);
  }

  Future clearUserDetails() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
