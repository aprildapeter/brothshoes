import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class pendingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget cardpesanan() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '20/04/2022',
                        style: inputTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        'Pickup & Delivery',
                        style: button2TextStyle.copyWith(fontWeight: light),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/sepatu.jpg',
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                                Text(
                                  'Menunggu',
                                  style: warningTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                                Text(
                                  'Aprilda Peter',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kategori',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                                Text(
                                  'Cuci Sepatu',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Treatment',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                                Text(
                                  'Deep Clean',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                                Text(
                                  'Rp 34000',
                                  style: secondaryTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            'Batalkan',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: semibold),
                          )))
                ],
              )),
        ),
      );
    }

    return ListView(padding: EdgeInsets.all(10), children: [
      cardpesanan(),
      cardpesanan(),
      cardpesanan(),
    ]);
  }
}
