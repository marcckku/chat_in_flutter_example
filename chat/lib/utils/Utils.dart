

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat/model/ChatUsers.dart';
import 'package:chat/theme/MyTheme.dart';
import 'package:chat/widgets/itemUser.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class Utils{

  static Widget initLoader() {
    return Scaffold(
      body: Center(
        child: Container(
          child: Loader(MyTheme.greyCard, MyTheme.canvasColor),
        ),
      ),
    );
  }

  static bool searchText(String str1, String searchText) {
    if (str1.isEmpty || searchText.isEmpty) {
      return false;
    }
    // else if (str1.toLowerCase().contains(searchText.toLowerCase()) || str1.toUpperCase().contains(searchText.toUpperCase())){
    //      return true;
    // }
    else if(str1.toUpperCase().startsWith(searchText.toUpperCase()) || str1.toLowerCase().startsWith(searchText.toLowerCase()) ){
      return true;
    }

    return false;
  }

  Widget formatImage(ChatUser  chatUser){
    return Builder(
        builder: (context) {
          if(chatUser.imageUrl.isNotEmpty && (chatUser.imageUrl.contains("http") || chatUser.imageUrl.contains("https")) ){
            return  CachedNetworkImage(
                placeholder: (context, url) =>
                    Container(child: CircularProgressIndicator()),
                imageUrl: chatUser.imageUrl, // "https://randomuser.me/api/portraits/men/5.jpg"
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  margin: EdgeInsets.all(1.5),
                  width:  MediaQuery.of(context).size.width  /7  ,
                  height: MediaQuery.of(context).size.height /7 ,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent.withOpacity(0.25),
                      /// opaco cover
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain
                      )
                  ),
                )
            );
          }else{
            return CircleAvatar(
              child: Image.asset(chatUser.imageUrl) ,
              // backgroundImage: NetworkImage(widget.chatUser.imageUrl),
              maxRadius: 30,
            );
        }
    });
  }


  static List<ItemUser> createListItems(List<ChatUser> users){
    List<ItemUser> listItems=<ItemUser>[];
    for(int index=0; index < users.length ; index++){
      ChatUser user = users.elementAt(index);
      var newUserItem = ItemUser(
        chatUser : ChatUser(
          index :      user.index,
          name:        user.name,
          messageText: user.messageText,
          imageUrl:    user.imageUrl,
          time:        user.time,
        ),
        isMessageRead: (index == 0 || index == 3)?true:false,
      );
      listItems.add(newUserItem);
    }
    return listItems;
  }
}




class Loader extends StatefulWidget {
  final Color color;
  final Color backgroundColor;

  @override
  Loader(this.color,  this.backgroundColor);

  LoaderState createState() =>
      LoaderState(color: this.color, backgroundColor: this.backgroundColor);
}

class LoaderState extends State with SingleTickerProviderStateMixin {
  final Color color;
  final Color backgroundColor;
  late AnimationController controller;


  LoaderState({required this.color, required this.backgroundColor});

  @override
  dispose() {
    if(controller != null){
      controller.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
        print(controller.value);
      }
    });
    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {});
      }
    });
  }

  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: Container(
          height: 100 - sin(controller.value * 4 * pi) * 10,
          width: 100 - sin(controller.value * 4 * pi) * 10,
          decoration: BoxDecoration(
              color: MyTheme.primaryColor, shape: BoxShape.circle, boxShadow: [BoxShadow(spreadRadius: 0.5 ,color:  MyTheme.primaryColorShadow, blurRadius: 100.0)]  ),
          child: Stack(children: [
            Align(
              alignment: Alignment(0.0, -0.6),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi) * 5,
                width: 6 - sin(controller.value * 4 * pi) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(-0.6 * 0.707, -0.7 * 0.707),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(-0.6, 0.0),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + 2 * pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + 2 * pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(-0.6 * 0.707, 0.6 * 0.707),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + 3 * pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + 3 * pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.6),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + 4 * pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + 4 * pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(0.6* 0.707, 0.6* 0.707),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + 5 * pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + 5 * pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: Alignment(0.6, 0.0),
              child: Container(
                height: 6 - sin(controller.value * 4 * pi + 6 * pi / 6) * 5,
                width: 6 - sin(controller.value * 4 * pi + 6 * pi / 6) * 5,
                decoration: BoxDecoration(
                    color: MyTheme.canvasColor,
                    shape: BoxShape.circle),
              ),
            ),
          ])),
    );
  }



}
