import 'package:flutter/cupertino.dart';

class ChatUser{
  int index;
  String name;
  String messageText;
  String imageUrl;
  String time;
  ChatUser({required this.index, required this.name,required this.messageText,required this.imageUrl,required this.time});
}