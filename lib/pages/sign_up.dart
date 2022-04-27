import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool _securetext = true;

TextEditingController nameController = TextEditingController(text: '');
TextEditingController phoneController = TextEditingController(text: '');
TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');
TextEditingController addressController = TextEditingController(text: '');

bool isLoading = false;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text,
      )) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              'Gagal Register!',
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
      return Container(
        child: Text(
          'Register',
          style: button1TextStyle.copyWith(fontSize: 50, fontWeight: bold),
        ),
      );
    }

    Widget Hero() {
      return Container(
        margin: EdgeInsets.only(top: margin),
        child: Center(
          child: Image.asset(
            'assets/images/register.png',
            height: 200,
          ),
        ),
      );
    }

    Widget Fullname() {
      return Container(
        // height: 50,
        margin: EdgeInsets.only(top: margin * 2),
        child: TextFormField(
          controller: nameController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            labelText: 'Nama Lengkap',
            labelStyle: button1TextStyle,
            hintText: 'Masukan Nama Lengkap',
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

    Widget Phone() {
      return Container(
        // height: 50,
        margin: EdgeInsets.only(top: 20),
        child: TextFormField(
          controller: phoneController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone_android,
              color: primaryColor,
            ),
            labelText: 'No. Tlpn',
            labelStyle: button1TextStyle,
            hintText: 'Masukan No. Tlpn',
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
    Widget Address() {
      return Container(
        // height: 50,
        margin: EdgeInsets.only(top: 20),
        child: TextFormField(
          maxLines: 3,
          controller: addressController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home_filled,
              color: primaryColor,
            ),
            labelText: 'Alamat Lengkap',
            labelStyle: button1TextStyle,
            hintText: 'Masukan Alamat Lengkap',
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

    Widget InputEmail() {
      return Container(
        // height: 50,
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
        child: TextFormField(
          controller: passwordController,
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
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 7,
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: handleSignUp,
            child: Text(
              'Register',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
            )),
      );
    }

    Widget Footer() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sudah punya akun ? ',
                style: button1TextStyle.copyWith(
                    fontSize: 16, fontWeight: medium)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Hero(),
                    Fullname(),
                    Phone(),
                    Address(),
                    InputEmail(),
                    InputPass(),
                    isLoading ? LoadingButton() : ButtonLogin(),
                    Footer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
