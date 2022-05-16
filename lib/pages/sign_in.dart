import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/pages/home/main_page.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/theme.dart';
import 'package:brothshoes/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _securetext = true;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passController.text,
      )) {
        if (authProvider.user.roles == 'pelanggan') {
          Navigator.pushNamed(context, '/home');
        } else {
          Navigator.pushNamed(context, '/admin');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget Header() {
      return Text(
        'Login',
        style: button1TextStyle.copyWith(fontSize: 50, fontWeight: bold),
      );
    }

    Widget Hero() {
      return Container(
        margin: EdgeInsets.only(top: margin),
        child: Center(
          child: Image.asset(
            'assets/images/login.png',
            height: 200,
          ),
        ),
      );
    }

    Widget InputEmail() {
      return Container(
        // height: 50,
        margin: EdgeInsets.only(top: margin * 2),
        child: TextFormField(
          controller: emailController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: primaryColor,
            ),
            labelText: 'Email',
            labelStyle: button1TextStyle,
            hintText: 'Masukan Email',
            hintStyle: inputTextStyle,
            fillColor: Colors.green[50],
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      );
    }

    Widget InputPass() {
      return Container(
        // height: 50,
        margin: const EdgeInsets.only(top: 20),
        child: TextFormField(
          controller: passController,
          obscureText: _securetext,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _securetext = !_securetext;
                });
              },
              child: Icon(
                _securetext ? Icons.remove_red_eye : Icons.security,
                color: primaryColor,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            labelText: 'Password',
            labelStyle: button1TextStyle,
            hintText: 'Masukan Password',
            hintStyle: inputTextStyle,
            fillColor: Colors.green[50],
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      );
    }

    Widget ButtonLogin() {
      return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 7,
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: handleSignIn,
            child: Text(
              'Login',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            )),
      );
    }

    Widget Footer() {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum punya akun? ',
                style: button1TextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Hero(),
              InputEmail(),
              InputPass(),
              isLoading ? const LoadingButton() : ButtonLogin(),
              Footer()
            ],
          ),
        )),
      ),
    );
  }
}
