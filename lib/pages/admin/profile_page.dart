import 'package:brothshoes/models/user_model.dart';
import 'package:brothshoes/providers/auth_provider.dart';
import 'package:brothshoes/providers/logout_provider.dart';
import 'package:brothshoes/providers/updateprofile_provider.dart';
import 'package:brothshoes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageAdmin extends StatelessWidget {
TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LogoutProvider logoutProvider = Provider.of<LogoutProvider>(context);
    UpdateProfileProvider updateProfileProvider = Provider.of<UpdateProfileProvider>(context);
    UserModel user = authProvider.user;

    handleLogout() async {
      if (await logoutProvider.logout(
        authProvider.user.token,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              'user.token',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
    

    Widget header() {
      return Container(
        height: 200,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(97),
          ),
          boxShadow: [
            BoxShadow(
                color: shadow2,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            ClipOval(child: Image.network(user.profilePhotoUrl)),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: whiteTextStyle.copyWith(
                        fontWeight: semibold, fontSize: 20),
                  ),
                  Text(
                    user.email,
                    style: gretyTextstyle.copyWith(
                        fontWeight: semibold, fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                icon: Icon(
                  Icons.edit,
                  color: whiteColor,
                ))
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(97),
          ),
          boxShadow: [
            BoxShadow(
                color: shadow2,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
        ),
        child: Column(children: [
          Row(
            children: [
              Icon(
                Icons.message,
                size: 35,
                color: primaryText,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Beri Masukan",
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Icon(
                  Icons.help,
                  size: 35,
                  color: primaryText,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Pusat Bantuan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: handleLogout,
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 35,
                    color: primaryText,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Logout",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      );
    }
    // Widget header() {
    //   return AppBar(
    //     backgroundColor: primaryColor,
    //     automaticallyImplyLeading: false,
    //     flexibleSpace: SafeArea(
    //       child: Container(
    //         margin: EdgeInsets.all(30),
    //         child: Row(
    //         children: [
    //           ClipOval(
    //             child: Image.asset('assets/images/avatar.jpg',
    //             width: 64,),
    //           ),
    //           SizedBox(width: 15,),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text('Aprilda Peter',
    //                 style: whiteTextStyle.copyWith(
    //                   fontWeight: semibold,
    //                   fontSize: 20
    //                 ),),
    //                 Text('aprildapeter@gmail.com',
    //                 style: inputTextStyle.copyWith(
    //                   fontWeight: semibold,
    //                   fontSize: 14
    //                 ),),
    //               ],
    //             ),
    //           ),
    //           IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: whiteColor,))
    //         ],
    //     ),
    //       )),
    //   );
    // }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            body(),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Versi 1.0",
                style: primaryTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
