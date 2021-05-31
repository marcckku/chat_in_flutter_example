import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat/chat/details/chat_detail_view.dart';
import 'package:chat/model/ChatUsers.dart';
import 'package:chat/utils/Utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemUser extends StatelessWidget{
  final bool isMessageRead;
  final ChatUser chatUser;
  ItemUser({ required this.chatUser, required this.isMessageRead});

  @override
  Widget build(BuildContext context) {
    print("  this.chatUser.index ${this.chatUser.index}");
    return ListTile(
      title: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ChatDetailPage(remoteUser: this.chatUser, isMessageRead: this.isMessageRead,);
          }
          ));
        },
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Utils().formatImage(chatUser),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(chatUser.name, style: TextStyle(fontSize: 16),),
                            SizedBox(height: 6,),
                            Text(chatUser.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(chatUser.time,style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
            ],
          ),
        ),
      ),
    );
  }
}
