import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_market/ui/about/about_screen.dart';
import 'package:hai_market/ui/cart/cart_screen.dart';
import 'package:hai_market/ui/home/home_viewmodel.dart';
import 'package:hai_market/ui/login/login_screen.dart';
import 'package:hai_market/ui/product_detail/product_detail_screen.dart';
import 'package:hai_market/ui/products/products_screen.dart';
import 'package:hai_market/ui/profile/profile_screen.dart';
import 'package:hai_market/ui/register/register_screen.dart';
import 'package:hai_market/util/extensions.dart';
import 'package:hai_market/util/size_util.dart';
import 'package:hai_market/util/snackbar_util.dart';
import 'package:hai_market/util/view_component/screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends Screen {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ScreenState<HomeScreen, HomeViewModel, HomeState> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(context: context, viewModel: viewModel),
            const SizedBox(
              height: 50,
            ),
            Categories(viewModel: viewModel),
            const SizedBox(
              height: 20,
            ),
            NewRelease(viewModel: viewModel),
            const SizedBox(
              height: 20,
            ),
            Footer(
              viewModel: viewModel,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) => ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: "#3B3A44".toColor(),
                  ),
                  child: viewModel.isLoggedIn()
                      ? Stack(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Welcome \n${viewModel.username}",
                              style: GoogleFonts.montserrat(
                                  color: "#FFDA60".toColor(), fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "What would you like to do?",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])
                      : const SizedBox()),
              ListTile(
                leading: viewModel.isLoggedIn() ? const Icon(Icons.person) : const Icon(Icons.login),
                title: Text(viewModel.isLoggedIn() ? 'My profile' : 'Sign in'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.isLoggedIn()
                      ? Navigator.pushNamed(context, ProfileScreen.routeName)
                      : Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
              if (!viewModel.isLoggedIn())
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text('Sign up'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                ),
              if (viewModel.isLoggedIn())
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign out'),
                  onTap: () {
                    Navigator.pop(context);
                    viewModel.signOut();
                    showSnackbar(context, "Signed out successfully");
                  },
                ),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Shop'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ProductsScreen.routeName, arguments: ProductsScreenArgument());
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('My Cart'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartScreen.routeName, arguments: CartScreenArgument());
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/hai_market_icon.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                title: const Text('About hai\'s market'),
                onTap: () {
                  Navigator.pop(context);
                  // Add any code you want to execute when the user taps on Home
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  final HomeViewModel viewModel;

  const Footer({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: "#545454".toColor(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.isLoggedIn()
                            ? showSnackbar(context, "You already signed in")
                            : Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.signOut();
                        showSnackbar(context, "Sign out success");
                      },
                      child: Text(
                        "Sign out",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AboutScreen.routeName);
                      },
                      child: Text(
                        "Hai's market",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "License",
                      style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
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
          const Spacer(),
          const Text(
            "Copyright ©  Asvian S",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}

class NewRelease extends StatelessWidget {
  const NewRelease({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: "#FBBE21".toColor(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New Release",
                style: GoogleFonts.bungee(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: BlocBuilder<HomeViewModel, HomeState>(
              bloc: viewModel,
              buildWhen: (previous, current) => previous.products == null && current.products != null,
              builder: (context, state) => state.products == null
                  ? Container()
                  : ListView.builder(
                      itemCount: state.products!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: ProductDetailScreenArgument(state.products![index]),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: SizeUtil.fullWidth(context) * 1.8 / 4,
                          child: Card(
                            color: "#F2F1F0".toColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    state.products![index].thumbnail!,
                                    height: 180,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      state.products![index].title!,
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
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      state.products![index].price!.toCurrency("\$"),
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
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({
    super.key,
    required this.context,
    required this.viewModel,
  });

  final BuildContext context;
  final HomeViewModel viewModel;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                "assets/ic_menu.png",
                width: 50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    Navigator.pushNamed(
                      context,
                      ProductsScreen.routeName,
                      arguments: ProductsScreenArgument(
                        searchKeyword: _searchController.text,
                      ),
                    );
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CartScreen.routeName,
                  arguments: CartScreenArgument(),
                );
              },
              child: Image.asset(
                "assets/ic_cart.png",
                width: 50,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  viewModel.isLoggedIn() ? ProfileScreen.routeName : LoginScreen.routeName,
                );
              },
              child: Image.asset(
                "assets/ic_avatar.png",
                width: 50,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/home_totebag_icon.png",
          width: SizeUtil.fullWidth(context) * 4 / 5,
          height: 300,
        ),
        Text(
          "FIND ANYTHING",
          style: GoogleFonts.quicksand(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "In your mind, In your heart",
          style: GoogleFonts.roboto(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: "#FBBE21".toColor(),
            fixedSize: Size(
              SizeUtil.fullWidth(context) * 4 / 5,
              70,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, ProductsScreen.routeName, arguments: ProductsScreenArgument());
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "SHOP",
              style: TextStyle(
                letterSpacing: 10,
                fontSize: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: BlocBuilder<HomeViewModel, HomeState>(
        bloc: viewModel,
        buildWhen: (previous, current) => previous.categories == null && current.categories != null,
        builder: (context, state) => state.categories == null
            ? Container()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductsScreen.routeName,
                        arguments: ProductsScreenArgument(
                          categoryName: state.categories![index].text,
                        ));
                  },
                  child: Container(
                    color: index.isEven ? "#E8E8E8".toColor() : "#474747".toColor(),
                    width: SizeUtil.fullWidth(context) * 3 / 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              state.categories![index].text.toCapitalCase(),
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: index.isEven ? Colors.black : Colors.white),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              state.categories![index].image,
                              height: 200,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Shop now",
                                style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: index.isEven ? Colors.black : Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: index.isEven ? Colors.black : Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
