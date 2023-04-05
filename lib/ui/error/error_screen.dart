import 'package:hai_market/model/error/error_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ErrorScreen extends StatefulWidget {
  static const routeName = "/error";

  final ErrorModel error;
  final String? from;

  const ErrorScreen({
    Key? key,
    required this.error,
    this.from,
  }) : super(key: key);

  @override
  ErrorScreenState createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/error_icon.png"),
                ),
                Text(
                  widget.error.code!,
                  style: GoogleFonts.kronaOne(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.error.message!,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.amber,
        backgroundColor: Colors.red,
        elevation: 0,
        onPressed: () => Navigator.pop(context),
        child: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
