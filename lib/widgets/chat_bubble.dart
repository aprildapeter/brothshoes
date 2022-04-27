import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:brothshoes/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  ChatBubble({
    this.isSender = false,
    this.text = '',
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.6
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: isSender ? Colors.lightGreen[200] : Colors.green[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular( isSender ? 20 : 0),
                    topRight: Radius.circular(isSender ? 0 : 20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ) 
                  ),
              child: Text(
                text,
                style: secondaryTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
