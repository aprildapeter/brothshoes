import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class TipsTasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget hero() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Image.asset('assets/images/helm.jpg'),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Rutin Dibersihkan',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Terlalu sering dipakai sampai lupa membersihkan akan membuat tas kalian menjadi dekil. Noda yang terlalu lama menempel membuat warna tas kalian jadi tidak awet. jadi cuci aja di kita !',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '2. Jangan Bawa Beban Terlalu Berat',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Emang sih, ransel dikenal sebagai tas yang praktis dan bisa buat nampung banyak barang. Tapi ingetm jangan berlebihan, kasihan ntar tali ranselmu rusak.',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '3. Menyimpan Tas',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Simpan tasmu di lemari yang kering dan jangan lembab. Beri spons/ bantalan didalamny, kasih silica gel juga. Hindari menumpuk tas saat disimpan',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Apapun jenis tasmu. Mau kotor atau kotor banget, kita siap merawatnya!',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            hero(),
            content(),
          ],
        ),
      ),
    );
  }
}
