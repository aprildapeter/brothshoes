import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/product_provider.dart';
import 'package:brothshoes/theme.dart';
import 'package:brothshoes/widgets/layanan_card.dart';
import 'package:brothshoes/widgets/pesanan_tile.dart';
import 'package:brothshoes/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePhotoUrl),
              radius: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Welcome',
                style: secondaryTextStyle.copyWith(
                  // fontSize: 12,
                  fontWeight: light,
                ),
              ),
              Text(
                user.name,
                style: primaryTextStyle.copyWith(
                  // fontSize: 12,
                  fontWeight: semibold,
                ),
              ),
              Text(
                user.roles,
                style: primaryTextStyle.copyWith(
                  // fontSize: 12,
                  fontWeight: semibold,
                ),
              ),
            ]),
          ],
        ),
      );
    }

    Widget hero() {
      return Container(
        height: 136,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(right: 30, left: 30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: shadow2,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bersihkan Sepatu Tanpa Noda ",
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "Free ongkir pick up & delivery dalam radius 10 km",
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/american.png",
                height: 110,
                width: 110,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      );
    }

    Widget LayananTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10, left: 30),
        child: Text(
          'Layanan',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget Layanan() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Row(
              children: productProvider.products
                  .map(
                    (product) => LayananCard(product),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget PesananAktif() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 10, left: 30),
        child: Text(
          'Pesananmu',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget OrderTile() {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            PesananTile(),
            PesananTile(),
          ],
        ),
      );
    }

    Widget TrickTitle() {
      return Container(
        margin: EdgeInsets.only(top: 15, bottom: 10, left: 30),
        child: Text(
          'Tips & Trick',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget TipsTrick() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(
            width: 30,
          ),
          Row(
            children: [
              const TipsCard(),
              const TipsCard(),
            ],
          )
        ]),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              header(),
              // const SizedBox(
              //   height: 30,
              // ),
              //hero(),
              LayananTitle(),
              Layanan(),
              PesananAktif(),
              OrderTile(),
              TrickTitle(),
              TipsTrick()
            ]),
          )
        ],
      ),
    );
  }
}
