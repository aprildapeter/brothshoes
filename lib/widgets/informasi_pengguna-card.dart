import 'package:brothshoes/models/cart_model.dart';
import 'package:brothshoes/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class InformasiPenggunaCard extends StatelessWidget {
  final UserModel cart;
  InformasiPenggunaCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Pengguna',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semibold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nama', style: secondaryTextStyle),
                  Text('Aprilda Peter', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('No. Tlpn', style: secondaryTextStyle),
                  Text('098765432123', style: secondaryTextStyle),
                ],
              ),
            ],
          );
  }
}