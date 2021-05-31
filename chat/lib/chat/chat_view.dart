import 'package:chat/model/ChatUsers.dart';
import 'package:chat/utils/Utils.dart';
import 'package:chat/widgets/itemUser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_bloc.dart';


class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ChatAppState(title: 'Flutter Demo Home Page'),
    );
  }
}

class ChatAppState extends StatefulWidget {
  ChatAppState({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _ChatAppStateState createState() => _ChatAppStateState();
}

class _ChatAppStateState extends State<ChatAppState> {
  int _selectedIndex =0;
  GlobalKey<ScaffoldState> globalKey  = new GlobalKey<ScaffoldState>();
  TextEditingController _controller   = new TextEditingController();
  late bool _isSearching;
  String _searchText = "";
  List <ChatUser> allUserChat= <ChatUser>[];
  List searchresult =  <String>[];
  List<ChatUser> searchedUserList = <ChatUser>[];
  late List<ItemUser> listItems=<ItemUser>[];

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
        listener: (ctx, state) {

        },
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (contextBloc, state) {
            _controller.addListener(() {
              if (_controller.text.isEmpty) {
                setState(() {
                  _isSearching = false;
                  _searchText = "";
                });
              } else {
                setState(() {
                  _isSearching = true;
                  _searchText = _controller.text;
                });
              }
            });

            if(state is  ChatLoadingState){
              contextBloc.read<ChatBloc>().add(ChatGetAllMessagesEvent()); ///////// SCATENA EVENTO QUI MANUALMENTE
              return Utils.initLoader();
              // contextBloc.watch<ChatBloc>().add(ChatGetAllMessagesEvent()); ///////// SCATENA EVENTO QUI MANUALMENTE
            }
            else if(state is  ChatAllUsersState){
              this.allUserChat.clear();
              this.allUserChat.addAll(state.chatUsers);
              return ChatPage(state.message, contextBloc);
            }
            return Utils.initLoader();
          },)
    );
  }

  StatefulWidget ChatPage( List<String> message, BuildContext contextBloc) {

    return Scaffold(
      key: globalKey,
      // appBar: buildAppBar(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: _controller,
                onChanged: (charText) {
                  print("onChanged  charText  " + charText);
                   searchUser(charText);
                 /// contextBloc.read<ChatBloc>().add(ChatGetSearchUsersEvent(charText: charText));
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 28,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(14),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400
                      )
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              if(searchedUserList.length > 0){
                return  Flexible(
                    child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedUserList.length,
                      padding: EdgeInsets.only(top: 10),
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return this.listItems.elementAt(index);
                      },
                    )
                );
              }else{
                this.listItems = Utils.createListItems(this.allUserChat);
                return  Flexible(
                    child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: this.allUserChat.length,
                      padding: EdgeInsets.only(top: 10),
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return this.listItems.elementAt(index);
                      },
                    )
                );
              }
            },
            )
          ],
        ),
      ),
      // body: new Container(
      //   child: new Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       new Flexible(
      //           child: searchResultUser.length != 0 || _controller.text.isNotEmpty
      //               ?
      //             new ListView.builder(
      //               shrinkWrap: true,
      //               itemCount: searchResultUser.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return new ListTile(
      //                   title:
      //                    ConversationList(
      //                        chatUser : ChatUser(
      //                        name:        searchResultUser[index].name,
      //                        messageText: searchResultUser[index].messageText,
      //                        imageUrl:    searchResultUser[index].imageUrl,
      //                        time:        searchResultUser[index].time,
      //                       ),
      //                       isMessageRead: (index == 0 || index == 3)?true:false,
      //                    ),
      //                 );
      //               },
      //             )
      //           : new ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: allUserChat.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return new ListTile(
      //                 title:  ConversationList(
      //                   chatUser : ChatUser(
      //                     name:        allUserChat[index].name,
      //                     messageText: allUserChat[index].messageText,
      //                     imageUrl:    allUserChat[index].imageUrl,
      //                     time:        allUserChat[index].time,
      //                   ),
      //                   isMessageRead: (index == 0 || index == 3)?true:false,
      //                 )
      //               );
      //             },
      //           ))
      //     ],
      //   ),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex ,
        onTap:(value) {
          setState(() {
            _selectedIndex =value;
          });
        } ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chats"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text("Channels"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }

  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton( color: Colors.red,
            icon: icon,
            onPressed: () {
              setState(() {
                if (this.icon.icon == Icons.search) {
                  this.icon = new Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = new TextField(
                    controller: _controller,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                    onChanged: (charText){
                      searchUser(charText);
                    },
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]
    );
  }


  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }


  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      searchUser("");
      _controller.clear();
    });
  }



  void searchUser(String charText) {
    this.searchedUserList.clear();
    this.listItems.clear();
      for (int i = 0; i < allUserChat.length; i++) {
        ChatUser currentUser = allUserChat[i];
        if ( Utils.searchText(currentUser.name, charText)  ) {
          print(" currentUser.name " +  currentUser.name + " index = ${currentUser.index}");
            searchedUserList.add(currentUser);
        }
      }
    this.listItems = Utils.createListItems(searchedUserList);
    print(" allUserChat.length " +  allUserChat.length.toString() );
    print(" listItems.length " +  listItems.length.toString() );
  }


}