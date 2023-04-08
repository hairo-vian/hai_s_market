
import 'package:flutter/material.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_viewmodel.dart';

class CartScreen extends Screen {
  static const String routeName = "/sample";

  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends ScreenState<CartScreen, CartViewModel, CartState> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(

    );
  }
}
