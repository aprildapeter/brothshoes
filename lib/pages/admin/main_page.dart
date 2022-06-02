import 'package:brothshoes/pages/admin/chat_page.dart';
import 'package:brothshoes/pages/admin/home_page.dart';
import 'package:brothshoes/pages/admin/pesanan_page.dart';
import 'package:brothshoes/pages/admin/profile_page.dart';
import 'package:brothshoes/pages/admin/transaksi_histori_page.dart';
import 'package:brothshoes/pages/cart_page.dart';
import 'package:brothshoes/pages/home/chat_page.dart';
import 'package:brothshoes/pages/home/home_page.dart';
import 'package:brothshoes/pages/home/pesanan_page.dart';
import 'package:brothshoes/pages/home/profile_page.dart';
import 'package:brothshoes/pages/home/transaksi_histori_page.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({Key key}) : super(key: key);

  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          // notchMargin: 10,
          // clipBehavior: Clip.antiAlias,
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
              // const BottomNavigationBarItem(
              //   icon: Icon(Icons.shopping_basket),
              //   label: 'Keranjang',
              // ),
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
          return HomePageAdmin();
          break;
        case 1:
          return PesananPageAdmin();
          break;
        case 2:
          return ProfilePageAdmin();
          break;
        default:
      }
    }

    return Scaffold(
      bottomNavigationBar: bottNav(),
      extendBody: true,
      // floatingActionButton: cartButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
    );
  }
}
