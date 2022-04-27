import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:brothshoes/widgets/histori_transaksi.dart';
import 'package:brothshoes/widgets/histori_transaksi_admin.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class TransaksiHistoriPageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    Widget Histori() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'histori',
              style: secondaryTextStyle,
            ),
            SizedBox(
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
      return Container(
        margin: EdgeInsets.all(5),
        child: Column(children: [
          HistoriTransaksiAdminCard(),
          HistoriTransaksiAdminCard(),
        ]),
      );
    }

    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pesananmu',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [Histori(), content()],
      ),
    );
  }
}
