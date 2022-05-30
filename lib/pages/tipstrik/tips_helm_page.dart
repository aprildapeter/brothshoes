import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class TipsHelmPage extends StatelessWidget {
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
              '1. Pantang banget buat kamu meletakkan helm di atas tangki bensin atau spion',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Biasanya kalau kamu parkir motor lalu meletakkan helm, kamu letakkan di mana? Di atas tangki bensin? Di spion? Pasti dua tempat itu jadi favorit buat kamu ya. Padahal, dua tempat itu paling dilarang buat meletakkan helm kamu',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '2. Jangan pakai helm saat rambuh basah atau sering pakai balaclava',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Kamu kalau berangkat kerja karena bangun kesiangan, pasti buru-buru banget kan. Sampai-sampai rambut masih basah sehabis pake shampoo pun dipaksa buat pakai helm. Padahal, hal itu selain merusak rambut kamu juga bisa membuat helm kamu jamuran dan bau loh. Kalau misal kamu sering keburu banget, kamu bisa anggarkan uang untuk membeli balaclava supaya helm kamu tidak kena air dari rambut kamu',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '3. Cuci langsung setelah kena hujan',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Ini yang paling jarang diketahui sama pecinta motor. Helm yang kehujanan bisa cepat jamuran. Hal ini dikarenakan kondisi keasaman air hujan mudah membuat jamur tumbuh di visor maupun permukaan helm kamu. Nah, kalau sehabis kehujanan kamu bisa langsung siram helm kamu pake air dan sabun cair. Lalu, kamu bilas dengan air bersih dan keringkan menggunakan kanebo',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '4. Setelah helm digunakan, letakkan helm dengan posisi terbalik',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Sehabis menggunakan helm, tak jarang kondisi kepala kamu pasti berkeringat dan basah. Nah, untuk menghindari helm kamu bau dan berjamur, kamu bisa meletakkan helm kamu dengan posisi terbalik saat disimpan. Jangan lupa, lebih baik kamu letakkan di atas lantai saja agar tidak jatuh.',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '5. Cuci Menggunakan Detergen Lembut',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Sebenarnya mencuci dengan detergen dapat membuat warna sepatu kamu cepat pudar. Apalagi tidak semua jenis sepatu bisa dicuci menggunakan detergen biasa. Pilihlah detergen yang berjenis mild atau lembut, misalnya detergen khusus untuk mencuci pakaian dan perlengkapan bayi. Jenis ini dijamin lebih lembut daripada deterjen biasa. Mild detergent mempunyai kandungan kalsium karbonat yang mampu untuk mencegah noda kekuningan pada sepatu favorit kamu. Gunakan air hangat sebagai campuran detergen ini saat akan mencuci sepatu kamu.',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Apapun jenis helm mu. Mau kotor atau kotor banget, kita siap merawatnya!',
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
