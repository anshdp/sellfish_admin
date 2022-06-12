import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellfish/router/app_constants.dart';
import 'package:sellfish/splash/splash.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashBloc _splashBloc = SplashBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc..add(SplashStartEvent()),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashNavigateToHome) {
              Navigator.pushNamed(context, RouteConstants.loginRoute);
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SellFish',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent),
                  ),
                  Image.asset(
                    'assets/images/splash_image.png',
                    width: 300,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
