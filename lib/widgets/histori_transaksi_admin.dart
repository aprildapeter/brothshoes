import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class HistoriTransaksiAdminCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: dangerText,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              'Tolak',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: semibold),
                            ))),
                    Container(
                      width: 150,

                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              'Terima',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: semibold),
                            ))),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
