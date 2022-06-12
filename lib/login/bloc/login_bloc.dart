// ignore_for_file: sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

late String errorMessage;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmailAndPassword) {
        try {
          final userCredential =
              await _authentication.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          print(userCredential.user!.uid);

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
