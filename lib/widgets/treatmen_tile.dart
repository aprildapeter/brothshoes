import 'package:brothshoes/models/product_model.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class TreatmentTile extends StatelessWidget {
  // const TreatmentTile({Key key}) : super(key: key);
  final ProductModel product;
  TreatmentTile(this.product);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget header() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: Image.network(
          product.url,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.fill,
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
            Text(
              product.category.name,
              style: secondaryTextStyle,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    'Rp ${product.price}',
                    style: button2TextStyle,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    product.description,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buttoncart() {
      return Container(
        margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              cartProvider.addCart(product);
              Navigator.pushReplacementNamed(context, '/cart');
            },
            child: Text(
              'Masukan ke keranjang',
              style:
                  whiteTextStyle.copyWith(fontWeight: semibold, fontSize: 20),
            )),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [header(), content(), buttoncart()]),
      ),
    );
  }
}

    // Widget content() {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         'Cuci Sepatu',
    //         style: primaryTextStyle.copyWith(
    //           fontSize: 20,
    //           fontWeight: semibold,
    //         ),
    //       ),
    //       Text(
    //         'Deep Clean',
    //         style: secondaryTextStyle,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 15),
    //         margin: EdgeInsets.symmetric(vertical: 10),
    //         height: 50,
    //         decoration: BoxDecoration(
    //             color: Colors.grey[200],
    //             borderRadius: BorderRadius.circular(10)),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               'Price',
    //               style: primaryTextStyle.copyWith(
    //                 fontSize: 20,
    //                 fontWeight: semibold,
    //               ),
    //             ),
    //             Text(
    //               'Rp 34000',
    //               style: button2TextStyle,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Apa itu Deep Clean ?',
    //             style: primaryTextStyle.copyWith(
    //               fontSize: 20,
    //               fontWeight: semibold,
    //             ),
    //           ),
    //           Text(
    //             'Deep Cleaning adalah melakukan pembersihan rumah secara lengkap pada seluruh bagian rumah. Deep cleaning hanya dilakukan oleh petugas Jasa Cleaning Service dengan peralatan khusus yang dapat melakukannya.',
    //             style: secondaryTextStyle,
    //             textAlign: TextAlign.justify,
    //           ),
    //         ],
    //       ),
    //     ],
    //   );
    // }

    

  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Container(
  //       // width: double.infinity,

  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           header(),
  //           content(),
  //           buttoncart()
  //         ],
  //       ),
  //     ),
  //   );
  // }

