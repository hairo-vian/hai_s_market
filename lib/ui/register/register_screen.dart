import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/ui/login/login_screen.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/snackbar_util.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';

import '../../util/size_util.dart';
import 'register_viewmodel.dart';

class RegisterScreen extends Screen {
  static const String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ScreenState<RegisterScreen, RegisterViewModel, RegisterState> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterViewModel, RegisterState>(
          listenWhen: (previous, current) {
            if (!previous.registerSuccess && current.registerSuccess) {
              return true;
            }

            if (previous.errorMessage != current.errorMessage) {
              return true;
            }

            return false;
          },
          listener: (context, state) {
            if (state.registerSuccess) {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              showSnackbar(context, "Register Success");
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
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Full name",
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
                          viewModel.createUser(
                            _emailController.text,
                            _nameController.text,
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
                        viewModel.createUser(
                          _emailController.text,
                          _nameController.text,
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
                        "Register",
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
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have account?",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: " Login",
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
