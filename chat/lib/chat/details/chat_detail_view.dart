
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat/model/ChatMessage.dart';
import 'package:chat/model/ChatUsers.dart';
import 'package:chat/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_detail_page__bloc.dart';

class ChatDetailPage extends StatefulWidget{
  final bool isMessageRead;
  final ChatUser remoteUser;
  ChatDetailPage({required this.remoteUser, required this.isMessageRead});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState(remoteUser: this.remoteUser, isMessageRead: this.isMessageRead);
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final bool isMessageRead;
  final ChatUser remoteUser;
  _ChatDetailPageState({required this.remoteUser, required this.isMessageRead});
  List<ChatMessage> messages=[];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return BlocListener<ChatDetailPageBloc, ChatDetailPageState>(
        listener: (ctx, state) {},
        child: BlocBuilder<ChatDetailPageBloc, ChatDetailPageState>(
          builder: (contextBloc, state) {
            if(state is  ChatDetailPageInitialState) {
               contextBloc.read<ChatDetailPageBloc>().add(GetConversationEvent());
              return Utils.initLoader();
            }
            if(state is GetConversationState){
              messages = state.messages;
              return screen();
            }
            return Utils.initLoader();
          },
        )
    );

  }

  Widget screen(){
   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    ///salva lista messaggi qui!!
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2),
                Utils().formatImage(widget.remoteUser),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(this.remoteUser.name,style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}