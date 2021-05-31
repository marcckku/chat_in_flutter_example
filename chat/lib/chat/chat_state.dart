part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

//state 1
class ChatLoadingState extends ChatState { }

//state 2
class ChatAllUsersState extends ChatState {

  final List<String> message;
  final List<ChatUser> chatUsers;
  ChatAllUsersState(this.message, this.chatUsers);
}

class ChatAllUsersSearchedState extends ChatState {
  final List<String> message;
  final List<ChatUser> allUserChat;
  final  List<ChatUser> searchedUserList;
  ChatAllUsersSearchedState(this.message, this.allUserChat, this.searchedUserList);
}


