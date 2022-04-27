import 'package:brothshoes/providers/cart_provider.dart';
import 'package:brothshoes/widgets/informasi_layanan_card.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Informasi Layanan',
            style:
                primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          Text(
            'Pickup & Delivery',
            style: button2TextStyle.copyWith(fontSize: 12),
          ),
        ]),
      );
    }

    Widget informasiLayanan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cartProvider.carts
            .map(
              (cart) => InformasiLayananCard(cart),
            )
            .toList(),
      );
    }

    Widget tambahItem() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ada lagi yang mau di treatment?',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 12),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(90, 30)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text(
                  'Tambah',
                  style: whiteTextStyle.copyWith(fontWeight: semibold),
                ))
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          header(),
          informasiLayanan(),
          tambahItem(),
        ],
      ),
    );
  }
}
