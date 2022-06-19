// ignore_for_file: sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sellfish/constants/db_collection_constants.dart';
import 'package:sellfish/constants/db_field_constants.dart';
import 'package:sellfish/helper/helper_functions.dart';

part 'login_event.dart';
part 'login_state.dart';

late String errorMessage;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmailAndPassword) {
        try {
          final userCredential =
              await _authentication.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          final id = userCredential.user!.uid;

          final collection =
              FirebaseFirestore.instance.collection(adminCollection);

          final docSnapshot = await collection.doc(id).get();

          if (docSnapshot.exists) {
            final data = docSnapshot.data();
            await HelperClass().setAdminData(
              id,
              userCredential.user!.email.toString(),
              data![adminNameField].toString(),
              data[adminTypeField] as String,
              true,
              data[adminPhoneNoField] as String,
            );
          }

          emit(NavigateToHome());
        } on FirebaseAuthException catch (error) {
          switch (error.code) {
            case 'invalid-email':
              errorMessage = 'Your email address appears to be malformed.';
              emit(InvalidLogin(message: errorMessage));

              break;
            case 'wrong-password':
              errorMessage = 'Incorrect Email or Password';
              emit(InvalidLogin(message: errorMessage));

              break;
            case 'user-not-found':
              errorMessage = 'Incorrect Email or Password';
              emit(InvalidLogin(message: errorMessage));

              break;
            default:
              errorMessage = 'Something went wrong .';
              emit(InvalidLogin(message: errorMessage));
          }
        }
      }
    });
  }
}





  // CollectionReference adminData =
  //     FirebaseFirestore.instance.collection(adminCollection);


// await adminData.doc(userCredential.user!.uid).set(
          //   {
          //     userNameField: 'admin123',
          //     emailField: userCredential.user!.email,
          //     phoneNoField: '9526071167',
          //     userIdField: userCredential.user!.uid,
          //     userTypeField: 'admin',
          //   },
          // );
