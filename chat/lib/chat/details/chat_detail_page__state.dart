part of 'chat_detail_page__bloc.dart';

@immutable
abstract class ChatDetailPageState {}

class ChatDetailPageInitialState extends ChatDetailPageState {}



class GetConversationState extends ChatDetailPageState {
  final  List<ChatMessage> messages;
  GetConversationState(this.messages);
}
