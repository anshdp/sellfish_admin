import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      print('worked');
      if (event is LogoutEvent) {
        try {
          await FirebaseAuth.instance.signOut();
          print('-------------------------');
          emit(LogoutSuccess());
          print('emit success');
        } catch (e) {
          emit(LogoutFailed());
        }
      }
    });
  }
}
