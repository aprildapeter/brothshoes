import 'package:brothshoes/models/cart_model.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class CheckoutItemCard extends StatelessWidget {
   final CartModel cart;
  CheckoutItemCard(this.cart);

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
             
            ],
          ),
        ]),
      ),
    );
  }
}
