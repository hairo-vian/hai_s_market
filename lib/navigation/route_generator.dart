import 'package:flutter/material.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/ui/about/about_screen.dart';
import 'package:hai_market/ui/cart/cart_screen.dart';
import 'package:hai_market/ui/error/error_screen.dart';
import 'package:hai_market/ui/home/home_screen.dart';
import 'package:hai_market/ui/login/login_screen.dart';
import 'package:hai_market/ui/product_detail/product_detail_screen.dart';
import 'package:hai_market/ui/products/products_screen.dart';
import 'package:hai_market/ui/profile/profile_screen.dart';
import 'package:hai_market/ui/register/register_screen.dart';
import 'package:hai_market/ui/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );

      case RegisterScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RegisterScreen(),
        );

      case AboutScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AboutScreen(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeScreen(),
        );

      case ProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProfileScreen(),
        );

      case CartScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            var argument = args as CartScreenArgument;
            return CartScreen(
              product: argument.product,
            );
          },
        );

      case ProductsScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              var argument = args as ProductsScreenArgument;
              return ProductsScreen(
                categoryName: argument.categoryName,
                searchKeyword: argument.searchKeyword,
              );
            });

      case ProductDetailScreen.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              var argument = args as ProductDetailScreenArgument;
              return ProductDetailScreen(argument.product);
            });

      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );

      case ErrorScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ErrorScreen(
            error: (args as ErrorModel),
          ),
        );

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ErrorScreen(
                  error: ErrorModel(
                    code: "DV100",
                    message: "Undefined proper route",
                  ),
                ));
    }
  }
}
