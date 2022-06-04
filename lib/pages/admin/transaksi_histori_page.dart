import 'package:brothshoes/models/transaction_model.dart';
import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:brothshoes/widgets/histori_transaksi_pelanggan.dart';
import 'package:brothshoes/widgets/histori_transaksi_admin.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class TransaksiHistoriPageAdmin extends StatelessWidget {
  final coba;
  TransaksiHistoriPageAdmin({this.coba});
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    Widget Histori() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'riwayat',
              style: secondaryTextStyle,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.history,
              color: secondaryText,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return transactionProvider.transactions
              .where((e) => e.status == coba)
              .isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  "Data transaksi masih kosong.",
                  style: TextStyle(
                      color: Color(0xff7BC4A0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          : Column(
              children: transactionProvider.transactions
                  .where((TransactionModel element) => element.status == coba)
                  .map((transaction) => HistoriTransaksiAdminCard(transaction))
                  .toList(),
            );
    }

    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pesanan',
          style: primaryTextStyle.copyWith(
              fontSize: 20, fontWeight: semibold, color: Colors.white),
        ),
      );
    }

    return Scaffold(
      // appBar: header(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<TransactionProvider>(context, listen: false)
              .getAllTransaksi();
        },
        child: ListView(
          children: [
            // Histori(),
            content(),
          ],
        ),
      ),
    );
  }
}
