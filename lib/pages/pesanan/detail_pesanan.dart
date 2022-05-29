import 'package:brothshoes/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/transaction_provider.dart';
import '../../theme.dart';

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
        children: [
          Image.asset(
            'assets/images/sepatu.jpg',
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      widget.transactionModel.status,
                      style: warningTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nama',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      widget.transactionModel.iduser.name,
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kategori',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      widget.transactionModel.categories_service,
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Treatment',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      widget.transactionModel.categories_service,
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      widget.transactionModel.totalPrice,
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
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
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
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
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: Text(
                                'Tolak',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 20, fontWeight: semibold),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });

                            handleUpdateStatus(context);
                          },
                          child: Text(
                            'Update Status',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: semibold),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
