import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/about";

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: SizeUtil.fullWidth(context) * 0.9 / 1,
              child: Text(
                "\"Hai's Market\" is an app created by Asvian Sulaeman as one of his portfolio projects. This app is a sample of marketplace application. The app was built using Flutter with MVVM pattern, dependency injection, REST API, Hive database, etc. The app uses a fake API, Dummy JSON (https://dummyjson.com/), for its product data and Platzi fake API (https://fakeapi.platzi.com/) for user authentication.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              color: "#545454".toColor(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contact Me",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri(
                              scheme: 'mailto',
                              path: 'asviansulaimam@gmail.com',
                            );
                            await launchUrl(url);
                          },
                          child: Image.asset(
                            "assets/ic_gmail.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse('https://github.com/hairo-vian');
                            await launchUrl(url);
                          },
                          child: Image.asset(
                            "assets/ic_github.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse('https://www.linkedin.com/in/asvian-sulaeman-93005a199/');
                            await launchUrl(url);
                          },
                          child: Image.asset(
                            "assets/ic_linkedin.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse('https://www.instagram.com/hairovian/');
                            await launchUrl(url);
                          },
                          child: Image.asset(
                            "assets/ic_instagram.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Copyright ©  Asvian S",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
