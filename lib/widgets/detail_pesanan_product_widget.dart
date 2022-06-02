import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';

class DetailPesananProductItemCard extends StatelessWidget {
  final ProductModel product;
  DetailPesananProductItemCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipOval(
                    child: Image.network(
                  product.category.imgUrl,
                  fit: BoxFit.fill,
                )),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: secondaryTextStyle.copyWith(),
                        ),
                        Text(
                          '\Rp ${product.price}',
                          style: secondaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
