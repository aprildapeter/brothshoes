import 'package:brothshoes/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nama', style: secondaryTextStyle),
                  Text('Aprilda Peter', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('No. Tlpn', style: secondaryTextStyle),
                  Text('098765432123', style: secondaryTextStyle),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget informasiLayanan() {
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
                  'Informasi Layanan',
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: semibold),
                ),
                Text(
                  'Pickup & Delivery',
                  style: button2TextStyle.copyWith(fontSize: 12),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Layanan', style: secondaryTextStyle),
                  Text('Cuci Sepatu', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Treatment', style: secondaryTextStyle),
                  Text('Deep Clean', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jumlah Barang', style: secondaryTextStyle),
                  Spacer(),
                  Icon(
                    Icons.plus_one_sharp,
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('1', style: secondaryTextStyle),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.exposure_minus_1_sharp),
                ],
              ),
              Divider(
                color: dateText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ada lagi yang mau di treatment?',
                    style: primaryTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 12),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(90, 30)),
                      onPressed: () {},
                      child: Text(
                        'Tambah',
                        style: whiteTextStyle.copyWith(fontWeight: semibold),
                      ))
                ],
              )
            ],
          ),
        ),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jadwal Pickup', style: secondaryTextStyle),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // width: 150,

                        child: Text(
                            "${selectDate.day}/${selectDate.month}/${selectDate.year}",
                            // overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle),
                      ),
                      IconButton(
                          onPressed: () async {
                            DateTime newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030));
                            if (newDate == null) return;
                            setState(() {
                              selectDate = newDate;
                            });
                          },
                          icon: Icon(
                            Icons.edit_calendar,
                            size: 30,
                            color: primaryColor,
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Pickup',
                    style: secondaryTextStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        'Alamat Pickup',
                        style: subTextStyle.copyWith(fontSize: 10),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.location_on,
                        color: dangerText,
                        size: 20,
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
                            child: Text(
                              'Jl. Raya Tidar No.100, Karangbesuki, Kec.Suk',
                              overflow: TextOverflow.ellipsis,
                              style: secondaryTextStyle,
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 0,
                            child: Container(child: Icon(Icons.arrow_right))),
                      ],
                    ),
                  ),
                  Divider(
                    color: dateText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jarak Tempuh',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        '1',
                        style: secondaryTextStyle,
                      )
                    ],
                  ),
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
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Pembayaran',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    'Metode Pembayaran',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COD (Bayar di tempat)',
                        style: secondaryTextStyle.copyWith(),
                      ),
                      Icon(
                        Icons.arrow_right,
                      ),
                    ],
                  ),
                  Divider(
                    
                    color: dateText,
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: secondaryTextStyle),
                  Text('Rp 68.000', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ongkir', style: secondaryTextStyle),
                  Text('Rp 0', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              DottedLine(
                dashColor: shadow2,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: secondaryTextStyle.copyWith(
                    fontWeight: bold
                  )),
                  Text('Rp 0', style: secondaryTextStyle.copyWith(
                    fontWeight: bold)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(
                    height: 25,
                  ),
                  informasiPengguna(),
                  SizedBox(
                    height: 20,
                  ),
                  informasiLayanan(),
                  SizedBox(
                    height: 20,
                  ),
                  InformasiPickup(),
                  SizedBox(
                    height: 20,
                  ),
                  InformasiPembayaran(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: primaryColor),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text(
                          'Pesan',
                          style: whiteTextStyle.copyWith(
                              fontSize: 20, fontWeight: semibold),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
