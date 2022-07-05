import 'package:brothshoes/models/category_model.dart';
import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/providers/product_provider.dart';
import 'package:brothshoes/widgets/layanan_card.dart';
import 'package:brothshoes/widgets/treatmen_tile.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class treatmentPage extends StatelessWidget {
  final CategoryModel categories;
  treatmentPage(this.categories);

  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> productProvider = Provider.of<ProductProvider>(context)
        .products
        .where((ProductModel element) => element.category.id == categories.id)
        .toList();
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider
                    .map(
                      (categories) => TreatmentTile(categories),
                    )
                    .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
