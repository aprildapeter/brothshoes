import 'package:brothshoes/models/category_model.dart';
import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/pages/treatment_page.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class LayananKatCard extends StatelessWidget {
  final CategoryModel categories;
  LayananKatCard(this.categories);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => treatmentPage(categories)));
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 10),
        child: Card(
          color: primaryColor,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                categories.imgUrl,
                width: MediaQuery.of(context).size.width,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(categories.name,
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      )),
                  // Text(categories.,
                  //     style: whiteTextStyle.copyWith(
                  //       fontWeight: light,
                  //       fontSize: 16,
                  //     )),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
