import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class TipsSepatuPage extends StatelessWidget {
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
              '1. Perhatikan Bahan Sepatu',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Tips pertama dalam merawat sepatu yang perlu kamu perhatikan adalah mengetahui dahulu bahan dari sepatumu tersebut. Perlu kamu ketahui, bahwa tidak semua sepatu memiliki perlakuan yang sama dalam merawatnya. Ada beberapa hal yang harus diketahui dan dilakukan tergantung jenis bahan sepatu yang kamu miliki tersebut.',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '2. Jangan Simpan Sepatu Dalam Keadaan Basah',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Tips kedua yang perlu kamu perhatikan adalah memperhatikan kondisi sepatumu. Pastikan bahwa kamu tidak menyimpan sepatumu dalam keadaan basah. Sebab, kondisi sepatu yang basah sangat mudah mendatangkan jamur dan bau tak sedap. Oleh karena itu, jangan pernah langsung menyimpannya ke dalam kotak atau rak. Selalu keringkan sepatu terlebih dahulu, misalnya saja dengan dijemur atau dikeringkan terlebih dahulu dengan hair dryer',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '3. Gunakan Pelindung Khusus',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Tips selanjutnya yang dapat kamu terapkan agar sepatu kesayanganmu tetap awet adalah dengan cara menyemprotkan pembersih dan pelindung khusus sepatu. Jika mengaku pencinta sepatu atau sneakers sejati, semprotan pembersih dan semprotan pelindung sepatu akan jadi senjata yang ampuh buat kamu. Semprotan pelindung khusus ini membantu sepatu kamu mampu melawan kotoran agar tidak menempel dan mudah dibersihkan. Kini, berbagai semprotan tersebut semakin banyak jenisnya. Bahkan di antaranya sudah sangat canggih karena dapat membuat sepatu kamu jadi anti air.',
              style: secondaryTextStyle.copyWith(),
              textAlign: TextAlign.justify,
            ),
            Text(
              '4. Bersihkan Langsung Saat Kotor',
              style:
                  primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 16),
            ),
            Text(
              'Hal selanjutnya yang harus kamu perhatikan agar sepatu atau sneakers favorit kamu tetap awet adalah membersihkannya langsung saat kotor. Tidak perlu untuk harus langsung dicuci. Setidaknya setelah kamu pakai sehari – hari, lakukan pembersihan ringan untuk mencegah kotoran menempel di sepatu kamu. Kotoran yang sudah menempel terlalu lama akan semakin sulit dibersihkan dan dapat merusak tampilan sepatu kamu secara permanen. Jadi kamu bisa menyikat kotoran yang kering dari permukaan sepatu menggunakan sikat gigi halus, kemudian gunakan lap basah untuk menyekanya sampai bersih.',
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
              'Apapun jenis sepatumu. Mau kotor atau kotor banget, kita siap merawatnya!',
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
