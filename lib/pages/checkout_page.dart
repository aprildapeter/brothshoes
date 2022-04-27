import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/cart_provider.dart';
import 'package:brothshoes/providers/transaction_provider.dart';
import 'package:brothshoes/widgets/checkout_item_card.dart';
import 'package:brothshoes/widgets/informasi_layanan_card.dart';
import 'package:brothshoes/widgets/informasi_pengguna-card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

DateTime selectDate = DateTime.now();

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    UserModel user = authProvider.user;

    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }

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
                    Text(user.name, style: secondaryTextStyle),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('No. Tlpn', style: secondaryTextStyle),
                    Text(user.phone, style: secondaryTextStyle),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Patokan', style: secondaryTextStyle),
                  Text('Patokan', style: secondaryTextStyle),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Detail Lokasi', style: secondaryTextStyle),
                  Text('Detail Lokasi', style: secondaryTextStyle),
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
                  Text('Rp ${cartProvider.totalPrice()}',
                      style: secondaryTextStyle),
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
                  Text('Total',
                      style: secondaryTextStyle.copyWith(fontWeight: bold)),
                  Text('Rp ${cartProvider.totalPrice()}',
                      style: secondaryTextStyle.copyWith(fontWeight: bold)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
        children: [
          // NOTE : LIST ITEM
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Barang',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semibold),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: cartProvider.carts
                    .map(
                      (cart) => CheckoutItemCard(cart),
                    )
                    .toList(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: shadow2,
          ),
          SizedBox(
            height: 10,
          ),
          informasiPengguna(),
          InformasiPickup(),
          InformasiPembayaran()
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: shadow2))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 30, right: 30, top: 20),
              child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: handleCheckout,
                      child: Text(
                        'Checkout Sekarang',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: semibold),
                      ))),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: header(),
        bottomNavigationBar: customBottomNav(),
        body: content());
  }
}
