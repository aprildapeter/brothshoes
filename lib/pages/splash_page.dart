import 'dart:async';

import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/categories_provider.dart';
import 'package:brothshoes/providers/product_provider.dart';
import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    getInit();

    super.initState();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    // await Provider.of<AuthProvider>(context, listen: false).getUser(authProvider.user);
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    await Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    // await Provider.of<AuthProvider>(context, listen: false)
    //     .getUser(authProvider.user);

    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/broth_logo.png')),
          ),
        ),
      ),
    );
  }
}
