import 'package:flutter/material.dart';
import 'package:hai_market/ui/home/home_screen.dart';
import 'package:hai_market/util/size_util.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ScaleTransition(
                scale: _animation!,
                child: Image.asset(
                  "assets/hai_market_icon.png",
                  height: 250,
                  width: SizeUtil.fullWidth(context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);

    _animation!.addListener(() => setState(() {}));
    _animationController!.forward();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
              context,
              HomeScreen.routeName,
            ));
  }
}
