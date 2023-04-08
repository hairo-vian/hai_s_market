import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/database/boxes.dart';
import 'package:hai_market/database/cart/cart.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:hai_market/util/snackbar_util.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cart_viewmodel.dart';

class CartScreenArgument {
  Product? product;

  CartScreenArgument({this.product});
}

class CartScreen extends Screen {
  static const String routeName = "/cart";

  final Product? product;

  const CartScreen({this.product, Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends ScreenState<CartScreen, CartViewModel, CartState> {
  @override
  void initState() {
    super.initState();
    viewModel.addToCart(widget.product);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<Cart>>(
        valueListenable: Boxes.getCarts().listenable(),
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.values.toList().length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: "#F7F5F2".toColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      value.values.toList()[index].product!.thumbnail!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.values.toList()[index].product!.title!,
                                          softWrap: true,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          value.values.toList()[index].product!.price!.toCurrency("\$"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: "#FCD396".toColor(),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 65,
                              child: Center(
                                child: Text(
                                  (value.values.toList()[index].amount! * value.values.toList()[index].product!.price!)
                                      .toCurrency("\$"),
                                  style: GoogleFonts.roboto(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(
                          flex: 20,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var putValue = value.values.toList()[index];
                                putValue.amount = putValue.amount! - 1;
                                if (putValue.amount == 0) {
                                  value.deleteAt(index);
                                } else {
                                  value.putAt(index, putValue);
                                }
                              },
                              child: Card(
                                color: "#F7F5F2".toColor(),
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 20,
                              child: Text(
                                value.values.toList()[index].amount!.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                var putValue = value.values.toList()[index];
                                putValue.amount = putValue.amount! + 1;
                                value.putAt(index, putValue);
                              },
                              child: Card(
                                color: "#F7F5F2".toColor(),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            value.deleteAt(index);
                          },
                          child: Card(
                            color: "#F7F5F2".toColor(),
                            child: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total : ",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _getTotal(value.values).toCurrency("\$"),
                    style: GoogleFonts.roboto(fontSize: 20, color: "#FB9600".toColor()),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: "#5E5D5C".toColor(), fixedSize: Size(SizeUtil.fullWidth(context), 60)),
              onPressed: () {
                value.clear();
                showSnackbar(context, "Checkout Success");
                //TODO : Show Check Animation then back to home
              },
              child: Text(
                "Checkout",
                style: GoogleFonts.roboto(color: "#FBBE21".toColor(), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  double _getTotal(Iterable<Cart> carts) {
    double total = 0;
    carts.toList().forEach((element) {
      total += element.amount! * element.product!.price!;
    });
    return total;
  }
}
