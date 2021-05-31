part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {

}


class ChatGetAllMessagesEvent extends ChatEvent{ }

class ChatGetSearchUsersEvent extends ChatEvent{
  final String charText;
  ChatGetSearchUsersEvent({required this.charText});
}
