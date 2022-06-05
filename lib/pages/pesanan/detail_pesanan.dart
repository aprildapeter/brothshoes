import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/widgets/detail_pesanan_product_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/transaction_provider.dart';
import '../../theme.dart';
import '../../widgets/checkout_item_card.dart';

class DetailPesanan extends StatefulWidget {
  TransactionModel transactionModel;
  DetailPesanan({this.transactionModel, Key key}) : super(key: key);

  @override
  State<DetailPesanan> createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  TransactionProvider transactionProvider;

  bool isLoading = false;

  String statusPesanan;

  @override
  void initState() {
    super.initState();
    statusPesanan = widget.transactionModel.status;
  }

  handleUpdateStatus(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();

    switch (widget.transactionModel.status) {
      case "menunggu":
        transactionProvider.updateStatusPesanan(prefs.getString("token"),
            widget.transactionModel.id.toString(), "diambil");

        break;
      case "diambil":
        transactionProvider.updateStatusPesanan(prefs.getString("token"),
            widget.transactionModel.id.toString(), "diproses");

        break;
      case "diproses":
        transactionProvider.updateStatusPesanan(prefs.getString("token"),
            widget.transactionModel.id.toString(), "dikirim");

        break;
      case "dikirim":
        transactionProvider.updateStatusPesanan(prefs.getString("token"),
            widget.transactionModel.id.toString(), "selesai");

        break;
      case "diambil besok":
        transactionProvider.updateStatusPesanan(prefs.getString("token"),
            widget.transactionModel.id.toString(), "diproses");

        break;
      case "selesai":
        break;
      case "dibatalkan":
        break;
      case "ditolak":
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.amber,
        content: Text(
          'Status pesanan berhasil diupdate.',
          textAlign: TextAlign.center,
        ),
      ),
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    transactionProvider = Provider.of<TransactionProvider>(context);
    Widget informasiPengguna() {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pengguna',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nama', style: secondaryTextStyle),
                    Text(widget.transactionModel.user.name,
                        style: secondaryTextStyle),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('No. Tlpn', style: secondaryTextStyle),
                    Text(widget.transactionModel.user.phone,
                        style: secondaryTextStyle),
                  ],
                ),
              ],
            )),
      );
    }

    Widget InformasiPickup() {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Informasi Pickup & Delivery',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jadwal Pickup', style: secondaryTextStyle?.copyWith()),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // width: 150,

                        child: Text(widget.transactionModel.timePickupDelivery,
                            // overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Alamat Pickup :',
                style: secondaryTextStyle?.copyWith(),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(
                    widget.transactionModel.address,
                    style: secondaryTextStyle?.copyWith(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Detail Lokasi :', style: secondaryTextStyle?.copyWith()),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(widget.transactionModel.detailLokasi,
                      style: secondaryTextStyle?.copyWith()),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget InformasiPembayaran() {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Informasi Pembayaran',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COD (Bayar di tempat)',
                        style: secondaryTextStyle.copyWith(),
                      ),
                    ],
                  ),
                  Divider(
                    color: dateText,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ongkir', style: secondaryTextStyle),
                  Text(widget.transactionModel.shippingPrice,
                      style: secondaryTextStyle),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              DottedLine(
                dashColor: shadow2,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: secondaryTextStyle),
                  Text('Rp. ' + widget.transactionModel.totalPrice,
                      style: secondaryTextStyle),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Pesanan',
          style: primaryTextStyle.copyWith(
              fontSize: 20, fontWeight: semibold, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'List Barang',
            style:
                primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          Column(
            children: widget.transactionModel.items
                .map(
                  (e) => DetailPesananProductItemCard(e.product),
                )
                .toList(),
          ),
          const Divider(),
          informasiPengguna(),
          InformasiPickup(),
          InformasiPembayaran(),
          // Image.asset(
          //   'assets/images/sepatu.jpg',
          //   width: MediaQuery.of(context).size.width * 0.3,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Status',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.status,
          //             style: warningTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Nama',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.user.name,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Kategori',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.categoriesService,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Treatment',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.categoriesService,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Total',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.totalPrice,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Status',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.status,
          //             style: warningTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Nama',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.user.name,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Kategori',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.categoriesService,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Treatment',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.categoriesService,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Total',
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //           Text(
          //             widget.transactionModel.totalPrice,
          //             style: secondaryTextStyle.copyWith(fontWeight: light),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

          widget.transactionModel.user.roles == "admin" ||
                  widget.transactionModel.user.roles == "karyawan"
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.green,
                        ))
                      : statusPesanan == "menunggu"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 50),
                                        primary: primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      handleUpdateStatus(context);
                                    },
                                    child: Text(
                                      'Terima',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, fontWeight: semibold),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 50),
                                        primary: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      var prefs =
                                          await SharedPreferences.getInstance();
                                      transactionProvider.updateStatusPesanan(
                                          prefs.getString("token"),
                                          widget.transactionModel.id.toString(),
                                          "ditolak");

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.amber,
                                          content: Text(
                                            'Status pesanan berhasil diupdate.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );

                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: Text(
                                      'Tolak',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, fontWeight: semibold),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : statusPesanan == "diambil"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(150, 50),
                                            primary: primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          handleUpdateStatus(context);
                                        },
                                        child: Text(
                                          'Sudah Diambil',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: semibold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(150, 50),
                                            primary: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          var prefs = await SharedPreferences
                                              .getInstance();
                                          transactionProvider
                                              .updateStatusPesanan(
                                                  prefs.getString("token"),
                                                  widget.transactionModel.id
                                                      .toString(),
                                                  "diambil besok");

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.amber,
                                              content: Text(
                                                'Status pesanan berhasil diupdate.',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );

                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                        child: Text(
                                          'Diambil Besok',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: semibold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : statusPesanan == "diambil besok"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(150, 50),
                                                primary: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              handleUpdateStatus(context);
                                            },
                                            child: Text(
                                              'Sudah Diambil',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: semibold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(150, 50),
                                                primary: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              var prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              transactionProvider
                                                  .updateStatusPesanan(
                                                      prefs.getString("token"),
                                                      widget.transactionModel.id
                                                          .toString(),
                                                      "ditolak");

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  backgroundColor: Colors.amber,
                                                  content: Text(
                                                    'Status pesanan berhasil diupdate.',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              );

                                              setState(() {
                                                isLoading = false;
                                              });
                                            },
                                            child: Text(
                                              'Ditolak',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: semibold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : statusPesanan == "selesai" ||
                                          statusPesanan == "ditolak" ||
                                          statusPesanan == "dibatalkan"
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(150, 50),
                                              primary: primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            setState(() {
                                              isLoading = true;
                                            });

                                            handleUpdateStatus(context);
                                          },
                                          child: Text(
                                            'Update Status',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: semibold),
                                          ),
                                        ),
                )
              : widget.transactionModel.user.roles == "pelanggan"
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.green,
                            ))
                          : statusPesanan == "menunggu"
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 50),
                                      primary: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    var prefs =
                                        await SharedPreferences.getInstance();
                                    transactionProvider.updateStatusPesanan(
                                        prefs.getString("token"),
                                        widget.transactionModel.id.toString(),
                                        "dibatalkan");

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xff7BC4A0),
                                        content: Text(
                                          'Pesanan Telah dbatalkan',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );

                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: Text(
                                    'Dibatalkan',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 20, fontWeight: semibold),
                                  ),
                                )
                              : Container(),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
