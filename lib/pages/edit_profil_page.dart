import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/updateprofile_provider.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';
import 'package:provider/provider.dart';

class EditprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UpdateProfileProvider updateProfileProvider =
        Provider.of<UpdateProfileProvider>(context);
    UserModel user = authProvider.user;

    TextEditingController nameController =
        TextEditingController(text: user.name);
    TextEditingController phoneController =
        TextEditingController(text: user.phone);
    TextEditingController addressController =
        TextEditingController(text: user.address);

    Widget header() {
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: primaryColor,
          // borderRadius:
          //     BorderRadius.only(bottomRight: Radius.circular(97)),
          boxShadow: [
            BoxShadow(
                color: shadow2,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
              SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.url),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 0,
                      right: -0,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: whiteColor,
                            size: 40,
                          )),
                    )
                  ]),
                  Text(
                    user.name,
                    style: whiteTextStyle.copyWith(
                        fontSize: 20, fontWeight: semibold),
                  ),
                  Text(
                    user.email,
                    style: gretyTextstyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          // borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: shadow2,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: semibold),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          // textAlignVertical: TextAlignVertical.bottom,
                          enabled: false,
                          decoration: InputDecoration.collapsed(
                            // border: OutlineInputBorder(),
                            // fillColor: Colors.grey[300],
                            // filled: true,
                            hintText: user.email,
                            hintStyle: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semibold),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintStyle: inputTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No.telp",
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semibold),
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintStyle: inputTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat Lengkap",
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semibold),
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintStyle: inputTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadow2,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    )
                  ],
                ),
                child: TextButton(
                  onPressed: () async {
                    if (await updateProfileProvider.update(
                      name: nameController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                      token: authProvider.user.token,
                    )) {
                      if (user.roles == "admin") {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/admin', (route) => false);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.amber,
                          content: Text(
                            "Gagal Update Profile !!!",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Simpan Perubahan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }
}
