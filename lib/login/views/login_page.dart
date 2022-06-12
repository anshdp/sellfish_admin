import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellfish/login/login.dart';
import 'package:sellfish/router/app_constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  String? _errorMessage = '';

  final LoginBloc _loginBloc = LoginBloc();
  TextEditingController emailController = TextEditingController(text: ''),
      passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            Navigator.pushNamed(context, RouteConstants.homeRoute);
          }
        },
        builder: (context, state) {
          if (state is InvalidLogin) {
            _errorMessage = state.message;
          }
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 200, horizontal: 30),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'SellFish',
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                color: const Color(0xff205072),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enter your login details',
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          eController: emailController,
                          hintText: 'Email',
                          secured: false,
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          pController: passwordController,
                          hintText: 'Password',
                          secured: true,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _errorMessage!,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(emailController.text);
                            print(passwordController.text);
                            _loginBloc.add(
                              LoginWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 140,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent),
                          ),
                          child: Text(
                            'Log In',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 0.168,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomPassCode(
                          linkText: 'Forgot password',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
