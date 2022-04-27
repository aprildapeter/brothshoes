import 'package:brothshoes/pages/pesanan/pending_page.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text('Pesanan',
              style: primaryTextStyle.copyWith(
                fontSize: 25, fontWeight: semibold,
              ),),
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
          body: const TabBarView(
            children: <Widget>[
              pendingPage(),
              Center(
                child: Text("Sedang Diproses"),
              ),
              Center(
                child: Text("Dikirim"),
              ),
              Center(
                child: Text("Selesai"),
              ),
              Center(
                child: Text("Ditolak"),
              ),
              Center(
                child: Text("Dibatalkan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}