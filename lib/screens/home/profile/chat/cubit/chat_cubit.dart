import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/model/message_model.dart';
import 'package:organico/screens/home/profile/chat/state/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  TextEditingController textEditingController = TextEditingController();

  List<Message> messages = [
  ];

  addToMessageList(List list, Message message) {
    if (message!="") {
      list.add(message);
    }
    emit(ChatInitialState());
  }

  bool isSentByMe = true;

  clear(TextEditingController controller) {
    controller.clear();
    emit(ChatInitialState());
  }
}
