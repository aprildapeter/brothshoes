import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class PesananTile extends StatelessWidget {
  const PesananTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cuci Sepatu',
                style: secondaryTextStyle,
              ),
              Text(
                'Deep Clean',
                style: subTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Text(
            'menunggu',
            style: warningTextStyle,
          )
        ],
      ),
    );
  }
}
