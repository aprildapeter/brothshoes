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
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

DateTime selectDate = DateTime.now();

class _CheckoutPageState extends State<CheckoutPage> {
  Position _currentPosition;
  String _currentAddress;

  TextEditingController _detailLokasiController = TextEditingController();

  double _ongkir;
  String _jarak;

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    _currentPosition = await _geolocatorPlatform.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ));

    // print(_currentPosition.latitude.toString() +
    //     ", " +
    //     _currentPosition.longitude.toString());

    String address = await getAddressFromLatLong(_currentPosition);
    print(address);

    double dist = _geolocatorPlatform.distanceBetween(-7.5536963, 112.2363532,
            _currentPosition.latitude, _currentPosition.longitude) /
        1000;

    print(dist.toString());
    setState(() {
      _currentAddress = address;
      _jarak = dist.toStringAsFixed(2);
      print(_jarak);
      if (dist > 2) {
        double jarakBaru = dist - 2;
        print(jarakBaru);

        _ongkir = jarakBaru.truncateToDouble() * 2500;
      } else {
        _ongkir = 0;
      }
    });
  }

  Future<String> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //print(placemarks);
    Placemark place = placemarks[0];
    return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return true;
  }

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
        _currentAddress,
        selectDate.toString(),
        _detailLokasiController.text,
        cartProvider.totalPrice() + _ongkir,
        _ongkir,
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nama', style: secondaryTextStyle),
                    Text(user.name, style: secondaryTextStyle),
                  ],
                ),
                const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jadwal Pickup',
                      style: secondaryTextStyle?.copyWith(
                          fontWeight: FontWeight.bold)),
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
                                lastDate: DateTime(2030),
                                selectableDayPredicate: (day) {
                                  if ((day.isAfter(DateTime.now()
                                          .subtract(Duration(days: 1)))) &&
                                      (day.isBefore(DateTime.now()
                                          .add(Duration(days: 7))))) {
                                    return true;
                                  }
                                  return false;
                                });
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
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Pickup',
                    style: secondaryTextStyle?.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  _currentAddress == null
                      ? const SizedBox()
                      : Text(
                          _currentAddress,
                          overflow: TextOverflow.visible,
                          style: secondaryTextStyle,
                        ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      _getCurrentPosition();
                    },
                    child: Text(
                      _currentAddress == null
                          ? 'Dapatkan lokasi sekarang'
                          : "Ulangi ambil lokasi",
                      style: whiteTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Detail Lokasi',
                  style: secondaryTextStyle?.copyWith(
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _detailLokasiController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Masukan detail lokasi',
                  hintStyle: inputTextStyle,
                  // fillColor: Colors.green[50],
                  // filled: true,
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: primaryColor),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: BorderSide(color: primaryColor),
                  // ),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COD (Bayar di tempat)',
                        style: secondaryTextStyle.copyWith(),
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
                  Text('Rp. '+cartProvider.totalPrice().toStringAsFixed(0),
                      style: secondaryTextStyle),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ongkir', style: secondaryTextStyle),
                  Text(
                      _ongkir == null
                          ? "Rp. 0"
                          : "Rp. " + _ongkir.toStringAsFixed(0).toString(),
                      style: secondaryTextStyle),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              DottedLine(
                dashColor: shadow2,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: secondaryTextStyle.copyWith(fontWeight: bold)),
                  Text(
                      _ongkir == null
                          ? "-"
                          : 'Rp. ' +
                              (cartProvider.totalPrice() + _ongkir)
                                  .toStringAsFixed(0),
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
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
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
              const SizedBox(
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
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: shadow2,
          ),
          const SizedBox(
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
              child: SizedBox(
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
                  ),
                ),
              ),
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
