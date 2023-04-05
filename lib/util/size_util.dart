import 'package:flutter/cupertino.dart';

class SizeUtil {
  static double fullWidth(BuildContext context)=>MediaQuery.of(context).size.width;
  static double fullHeight(BuildContext context)=>MediaQuery.of(context).size.height;
}