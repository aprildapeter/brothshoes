import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/providers/product_provider.dart';
import 'package:brothshoes/widgets/layanan_card.dart';
import 'package:brothshoes/widgets/treatmen_tile.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class treatmentPage extends StatelessWidget {
  final ProductModel product;
  treatmentPage(this.product);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pilih Treatment',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(children: [TreatmentTile(product)]),
      );
    }

    return Scaffold(
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
