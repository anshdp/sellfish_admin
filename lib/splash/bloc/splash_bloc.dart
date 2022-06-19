import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sellfish/helper/helper_functions.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStartEvent>((event, emit) async {
      await Future<dynamic>.delayed(const Duration(seconds: 5));
      await HelperClass().getAdminData();
      print('-------------------------------------');
      print(isLogin);
      if (isLogin == true) {
        emit(SplashNavigateToHome());
      } else {
        emit(SplashNavigateToLogin());
      }
    });
  }
}
