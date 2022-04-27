import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';

class Begining extends StatelessWidget {
  const Begining({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "BROTH",
            style: whiteTextStyle.copyWith(fontSize: 65, fontWeight: semibold),
          ),
          Text(
            "Helmet | Accessories | Shoes",
            style: whiteTextStyle.copyWith(
              fontSize: 15,
              fontWeight: reguler,
            ),
          ),
        ]),
      );
    }

    Widget Hero() {
      return Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
              child: Image.asset(
            "assets/images/begining.png",
            fit: BoxFit.cover,
            height: 210,
          )));
    }

    Widget CekStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-in');
          },
          child: Text("Cek Status",
              style: button1TextStyle.copyWith(
                  fontSize: 25, fontWeight: semibold)),
          style: TextButton.styleFrom(
              backgroundColor: whiteColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      );
    }

    Widget Login() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-in');
          },
          child: Text("Login",
              style: button1TextStyle.copyWith(
                  fontSize: 25, fontWeight: semibold)),
          style: TextButton.styleFrom(
              backgroundColor: whiteColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      );
    }

    Widget Footer(){
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum punya akun ? ',
             style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium)
              ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text(
                  'Register',
                  style: button2TextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ))
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Hero(),
              CekStatus(),
              Login(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
