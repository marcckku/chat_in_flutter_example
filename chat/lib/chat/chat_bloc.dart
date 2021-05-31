import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/model/ChatUsers.dart';
import 'package:chat/utils/Utils.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatLoadingState());
  List<ChatUser> allUserChat=[];
  List<String> message=[];



  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if(event is ChatGetAllMessagesEvent){
      initList();
      yield ChatAllUsersState(message, allUserChat);
    }

  }

  void initList(){
    allUserChat.clear();
    message.clear();
    message= [
      "Hola come va?",
      "Ciao tutto bene?",
      "Ci sei?",
      "Ciao!!",
      "Va bene",
    ];

    allUserChat = [
      ChatUser(index: 1, name: "Jane Russel"   , messageText: "Awesome Setup"                  , imageUrl: "assets/images/user-sagoma.jpg", time: "Now"),
      ChatUser(index: 2, name: "Glady's Murphy", messageText: "That's Great"                   , imageUrl: "assets/images/user-sagoma.jpg", time: "Yesterday"),
      ChatUser(index: 3, name: "Jorge Henry"   , messageText: "Hey where are you?"             , imageUrl: "assets/images/user-sagoma.jpg", time: "31 Mar"),
      ChatUser(index: 4, name: "Philip Fox"    , messageText: "Busy! Call me in 20 mins"       , imageUrl: "assets/images/user-sagoma.jpg", time: "28 Mar"),
      ChatUser(index: 5, name: "Debra Hawkins" , messageText: "Thankyou, It's awesome"         , imageUrl: "assets/images/user-sagoma.jpg", time: "23 Mar"),
      ChatUser(index: 6, name: "Jacob Pena"    , messageText: "will update you in evening"     , imageUrl: "assets/images/user-sagoma.jpg", time: "17 Mar"),
      ChatUser(index: 7, name: "Andrey Jones"  , messageText: "Can you please share the file?" , imageUrl: "assets/images/user-sagoma.jpg", time: "24 Feb"),
      ChatUser(index: 8, name: "John Wick"     , messageText: "How are you?"                   , imageUrl: "assets/images/user-sagoma.jpg", time: "18 Feb"),
    ];

  }
}
