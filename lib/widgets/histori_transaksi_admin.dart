import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/pages/pesanan/detail_pesanan.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class HistoriTransaksiAdminCard extends StatelessWidget {
  TransactionModel transactionModel;
  HistoriTransaksiAdminCard(this.transactionModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPesanan(
                transactionModel: transactionModel,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionModel.timePickupDelivery,
                      style: inputTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      transactionModel.categoriesService,
                      style: button2TextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/sepatu.jpg',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    const SizedBox(
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
                                transactionModel.status,
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
                                transactionModel.user.name,
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
                                transactionModel.items[0].product.category.name,
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
                                transactionModel.items[0].product.name,
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
                                'Rp. ' + transactionModel.totalPrice,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 150,
                //       margin: const EdgeInsets.only(top: 10),
                //       height: 40,
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             primary: dangerText,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10))),
                //         onPressed: () {},
                //         child: Text(
                //           'Tolak',
                //           style: whiteTextStyle.copyWith(
                //               fontSize: 20, fontWeight: semibold),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 150,
                //       margin: const EdgeInsets.only(top: 10),
                //       height: 40,
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             primary: primaryColor,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10))),
                //         onPressed: () {},
                //         child: Text(
                //           'Terima',
                //           style: whiteTextStyle.copyWith(
                //               fontSize: 20, fontWeight: semibold),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
