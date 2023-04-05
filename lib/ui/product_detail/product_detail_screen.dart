import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/model/product/product.dart';
import 'package:hai_market/ui/product_detail/product_detail_viewmodel.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:hai_market/util/view_component/image_slider.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';

class ProductDetailScreenArgument {
  final Product product;

  ProductDetailScreenArgument(this.product);
}

class ProductDetailScreen extends Screen {
  static const String routeName = "/product_detail";

  final Product product;

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends ScreenState<ProductDetailScreen, ProductDetailViewModel, ProductDetailState> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: SizeUtil.fullHeight(context) * 1 / 2,
                child: Stack(children: [
                  ImageSlider(
                    imagePaths: widget.product.images!,
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        //TODO : Open Add Cart Screen
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: "#FBBE21".toColor(),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.title!,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.price!.toCurrency("\$"),
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Stock : ${widget.product.stock!.toInt()}"),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.product.description!,
                style: GoogleFonts.openSans(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
