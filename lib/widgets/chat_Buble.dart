import 'package:chatapp/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
   required this.message
  });

 final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      
      alignment: Alignment.centerLeft,
      child: Container(
        
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16,right: 16),
          margin: EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: KPrimaryColor,
            
          ),
          child: Text(message.message ,style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
    );
  }
}


class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    super.key,
   required this.message
  });

 final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16,right: 16),
          margin: EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0xff006D84),
            
          ),
          child: Text(message.message ,style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
    );
  }
}