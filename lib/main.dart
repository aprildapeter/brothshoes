import 'package:brothshoes/pages/admin/main_page.dart';
import 'package:brothshoes/pages/cart_page.dart';
import 'package:brothshoes/pages/checkout_page.dart';
import 'package:brothshoes/pages/detail_chat_page.dart';
import 'package:brothshoes/pages/begining.dart';
import 'package:brothshoes/pages/edit_profil_page.dart';
import 'package:brothshoes/pages/home/main_page.dart';
import 'package:brothshoes/pages/sign_in.dart';
import 'package:brothshoes/pages/sign_up.dart';
import 'package:brothshoes/pages/splash_page.dart';
import 'package:brothshoes/pages/tipstrik/tips_helm_page.dart';
import 'package:brothshoes/pages/tipstrik/tips_sepatu_page.dart';
import 'package:brothshoes/pages/tipstrik/tips_tas_page.dart';
import 'package:brothshoes/pages/transaksi_page.dart';
import 'package:brothshoes/pages/treatment_page.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:brothshoes/providers/categories_provider.dart';
import 'package:brothshoes/providers/logout_provider.dart';
import 'package:brothshoes/providers/product_provider.dart';
import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:brothshoes/providers/updateprofile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogoutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/begining': (context) => Begining(),
          '/sign-in': (context) => SigninPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/admin': (context) => MainPageAdmin(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditprofilePage(),
          // '/pilih-treatment': (context) => treatmentPage(),
          '/transaksi': (context) => Transaksi(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/tips-sepatu': (context) => TipsSepatuPage(),
          '/tips-tas': (context) => TipsTasPage(),
          '/tips-helm': (context) => TipsHelmPage(),
        },
      ),
    );
  }
}
