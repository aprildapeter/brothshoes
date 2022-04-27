import 'package:brothshoes/theme.dart';
import 'package:brothshoes/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatPageAdmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
        ),
      );
    }

    Widget empetyChat() {
      return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.support_agent,
            color: primaryText,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Belum ada pesan ?',
              style: secondaryTextStyle.copyWith(
                  fontSize: 20, fontWeight: medium)),
          SizedBox(
            height: 5,
          ),
          Text('Silakan melakukan transaksi terlebih dulu',
              style: subTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                fixedSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {},
              child: Text(
                'Telusuri',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
              ))
        ],
      ));
    }

    Widget content() {
      return Expanded(child: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            SizedBox(height: 30,),
            ChatTile()
          ],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
