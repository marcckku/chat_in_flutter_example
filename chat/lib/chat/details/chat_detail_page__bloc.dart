import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/model/ChatMessage.dart';
import 'package:meta/meta.dart';

part 'chat_detail_page__event.dart';
part 'chat_detail_page__state.dart';

class ChatDetailPageBloc extends Bloc<ChatDetailPageEvent, ChatDetailPageState> {
  ChatDetailPageBloc() : super(ChatDetailPageInitialState());
  List<ChatMessage> messages=[];
  @override
  Stream<ChatDetailPageState> mapEventToState(
    ChatDetailPageEvent event,
  ) async* {
    initListMessages();
    if(event is GetConversationEvent){
      yield GetConversationState(messages);
    }

  }


  void initListMessages(){
    messages = [
      ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
      ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
      ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
      ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
      ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ];
  }
}
