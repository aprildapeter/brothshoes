import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class TipsCard extends StatelessWidget {
  final navigasi;
  final title;
  final img;
  // ignore: use_key_in_widget_constructors
  const TipsCard({this.navigasi, this.img, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        title,
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: secondaryColor),
                          onPressed: () {
                            Navigator.pushNamed(context, navigasi);
                          },
                          child: Text('Selengkapnya'))
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    img,
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
