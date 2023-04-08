import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/ui/home/home_screen.dart';
import 'package:hai_market/ui/login/login_viewmodel.dart';
import 'package:hai_market/ui/register/register_screen.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:hai_market/util/snackbar_util.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';

class LoginScreen extends Screen {
  static const String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ScreenState<LoginScreen, LoginViewModel, LoginState> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginViewModel, LoginState>(
          listenWhen: (previous, current) {
            if (!previous.loginSuccess! && current.loginSuccess!) {
              return true;
            }

            if (previous.errorMessage != current.errorMessage) {
              return true;
            }

            return false;
          },
          listener: (context, state) {
            if (state.loginSuccess!) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              showSnackbar(context, "Welcome ${viewModel.username}");
            }

            if (state.errorMessage.isNotEmpty) {
              showSnackbar(context, state.errorMessage);
            }
          },
          builder: (context, state) => state.isLoading
              ? SizedBox(
                  width: SizeUtil.fullWidth(context),
                  height: SizeUtil.fullHeight(context),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: "#FBBE21".toColor(),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/hai_market_icon.png',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "E-mail",
                        ),
                        onSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        onSubmitted: (value) {
                          viewModel.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            SizeUtil.fullWidth(context) * 4 / 5,
                            50,
                          ),
                          backgroundColor: "#5E5D5C".toColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                          color: "#FBBE21".toColor(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have account?",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: " Register",
                              style: GoogleFonts.roboto(
                                color: "#FBBE21".toColor(),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
