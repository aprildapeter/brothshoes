import 'package:brothshoes/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: primaryText,
          centerTitle: false,
          title: Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: whiteColor,
                  backgroundImage: AssetImage('assets/images/broth_logo.png'),
                  radius: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Broth')
              ],
            ),
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: secondaryTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    child: Icon(
                  Icons.send,
                  color: primaryText,
                  size: 35,
                )),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          ChatBubble(isSender: true, text: 'Ada yang bisa dibantu',),
          ChatBubble(isSender: false, text: 'Ada yang bisa dibantu Ada yang bisa dibantu Ada yang bisa dibantu',)
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
