import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/ui/product_detail/product_detail_screen.dart';
import 'package:hai_market/ui/products/products_viewmodel.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';

import '../../util/size_util.dart';

class ProductsScreenArgument {
  final String? categoryName;
  final String? searchKeyword;

  ProductsScreenArgument({this.categoryName, this.searchKeyword});
}

class ProductsScreen extends Screen {
  static const String routeName = "/products";

  final String? categoryName;
  final String? searchKeyword;

  const ProductsScreen({
    Key? key,
    this.categoryName,
    this.searchKeyword,
  }) : super(key: key);

  @override
  SampleScreenState createState() => SampleScreenState();
}

class SampleScreenState extends ScreenState<ProductsScreen, ProductsViewModel, ProductsState> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchKeyword ?? "";
    viewModel.getProductList(widget.categoryName, widget.searchKeyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        viewModel.fetchNextPage(
          widget.categoryName,
          widget.searchKeyword,
        );
      }
    });
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: "#F7F5F2".toColor(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeUtil.fullHeight(context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    viewModel.searchProducts(widget.categoryName, _searchController.text);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              BlocBuilder<ProductsViewModel, ProductsState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state.products == null) {
                      return Container();
                    }
                    var products = state.products!;
                    return Expanded(
                      child: GridView.count(
                        controller: _scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        children: List.generate(
                          products.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailScreen.routeName,
                                arguments: ProductDetailScreenArgument(
                                  products[index],
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: SizeUtil.fullWidth(context) * 1.8 / 4,
                              height: 350,
                              child: Card(
                                color: "#F2F1F0".toColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Image.network(
                                          products[index].thumbnail!,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          products[index].title!,
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                                        child: Text(
                                          products[index].price!.toCurrency("\$"),
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
