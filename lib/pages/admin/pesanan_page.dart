import 'package:brothshoes/pages/admin/transaksi_histori_page.dart';
import 'package:brothshoes/pages/pesanan/pending_page.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';

class PesananPageAdmin extends StatelessWidget {
  // const PesananPageAdmin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 8,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Pesanan',
                style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  fontWeight: semibold,
                ),
              ),
            ),
            backgroundColor: whiteColor,
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Color(0xff7BC4A0),
              indicatorColor: Color(0xff7BC4A0),
              tabs: [
                Tab(
                  text: 'Menunggu',
                ),
                Tab(
                  text: 'Diambil',
                ),
                Tab(
                  text: 'Diambil Besok',
                ),
                Tab(
                  text: 'Diproses',
                ),
                Tab(
                  text: 'Dikirim',
                ),
                Tab(
                  text: 'Selesai',
                ),
                Tab(
                  text: 'Ditolak',
                ),
                Tab(
                  text: 'Dibatalkan',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TransaksiHistoriPageAdmin(coba: 'menunggu'),
              TransaksiHistoriPageAdmin(coba: 'diambil'),
              TransaksiHistoriPageAdmin(coba: 'diambil besok'),
              TransaksiHistoriPageAdmin(coba: 'diproses'),
              TransaksiHistoriPageAdmin(coba: 'dikirim'),
              TransaksiHistoriPageAdmin(coba: 'selesai'),
              TransaksiHistoriPageAdmin(coba: 'ditolak'),
              TransaksiHistoriPageAdmin(coba: 'dibatalkan'),
            ],
          ),
        ),
      ),
    );
  }
}
