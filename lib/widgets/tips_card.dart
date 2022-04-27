import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tips & Trick Cara Merawat Tas",
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryColor
                        ),
                        onPressed: (){}, child: Text('Selengkapnya'))
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/tas.jpg",
                    height: 110,
                    width: 110,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
