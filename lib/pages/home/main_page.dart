import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/pages/cart_page.dart';
import 'package:brothshoes/pages/home/chat_page.dart';
import 'package:brothshoes/pages/home/home_page.dart';
import 'package:brothshoes/pages/home/pesanan_page.dart';
import 'package:brothshoes/pages/home/profile_page.dart';
import 'package:brothshoes/pages/home/transaksi_histori_page.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
     AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Icon(Icons.shopping_basket, color: whiteColor),
      );
    }

    Widget bottNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            unselectedItemColor: whiteColor,
            selectedItemColor: secondaryColor,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Beranda',
                backgroundColor: whiteColor,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Pesanan',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'Keranjang',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return PesananPage();
          break;
        case 2:
          return const CartPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
      }
    }

    return Scaffold(
      bottomNavigationBar: bottNav(),
      extendBody: true,
      // floatingActionButton: cartButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<AuthProvider>(context, listen: false)
              .getUser(authProvider.user);
        },
        child: body(),
      ),
    );
  }
}
