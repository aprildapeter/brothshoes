import 'package:brothshoes/models/cart_model.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class InformasiLayananCard extends StatelessWidget {
  final CartModel cart;
  InformasiLayananCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                  cart.product.url,
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
                      cart.product.category.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cart.product.name,
                          style: secondaryTextStyle.copyWith(
                          ),
                        ),
                        Text(
                          '\Rp ${cart.product.price}',
                          style: secondaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/images/iconplus.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/images/iconminus.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('Layanan', style: secondaryTextStyle),
          //     Text(cart.product.category.name, style: secondaryTextStyle),
          //   ],
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('Treatment', style: secondaryTextStyle),
          //     Text(cart.product.name, style: secondaryTextStyle),
          //   ],
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('Harga', style: secondaryTextStyle),
          //     Text('Rp ${cart.product.price}', style: secondaryTextStyle),
          //   ],
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('Jumlah Barang', style: secondaryTextStyle),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: () {
          //         cartProvider.addQuantity(cart.id);
          //       },
          //       child: Icon(
          //         Icons.plus_one_sharp,
          //         size: 20,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Text(cart.quantity.toString(), style: secondaryTextStyle),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         cartProvider.reduceQuantity(cart.id);
          //       },
          //       child: Icon(Icons.exposure_minus_1_sharp)),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
