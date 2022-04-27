import 'package:brothshoes/pages/transaksi_page.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:brothshoes/theme.dart';
import 'package:brothshoes/widgets/cart_card.dart';
import 'package:brothshoes/widgets/chat_tile.dart';
import 'package:brothshoes/widgets/transaksi_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Keranjang Transaksi',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget empetyCart() {
      return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            color: primaryText,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Keranjang masih kosong !!!',
              style: secondaryTextStyle.copyWith(
                  fontSize: 20, fontWeight: medium)),
          SizedBox(
            height: 5,
          ),
          Text('Silakan melakukan transaksi terlebih dulu',
              style: subTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                fixedSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {},
              child: Text(
                'Telusuri',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
              ))
        ],
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          children: [CartCard()],
        ),
      ));
    }

    Widget customBottomNav() {
      return Container(
         decoration: BoxDecoration(
          border: Border(top: BorderSide(color: shadow2))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Subtotal',
                          style: primaryTextStyle,
                        ),
                        Text(
                          'Rp ${cartProvider.totalPrice()}',
                          style: button2TextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/checkout');
                          },
                          child: Text(
                            'Checkout',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: semibold),
                          )))
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: cartProvider.carts.length == 0 ? SizedBox(): customBottomNav(),
      body: Column(
        children: [
          header(), 
          cartProvider.carts.length == 0 ? empetyCart() : content()],
      ),
    );
  }
}
