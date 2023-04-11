import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/ui/profile/profile_viewmodel.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';

class ProfileScreen extends Screen {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ScreenState<ProfileScreen, ProfileViewModel, ProfileState> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeUtil.fullHeight(context),
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
              const SizedBox(height: 20),
              const Icon(
                Icons.person,
                size: 100,
              ),
              Text(
                "Email : \n${viewModel.userEmail}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Username : \n${viewModel.userName}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Joined since : \n${viewModel.joinedDate}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
