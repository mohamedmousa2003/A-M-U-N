import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/use_cases/send_message_usecase.dart';

class ChatCubit extends Cubit<List<ChatMessageEntity>> {
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit(this.sendMessageUseCase) : super([]);

  void sendMessage(String text, {File? image}) async {
    emit([
      ...state,
      ChatMessageEntity(text: text, isUser: true, image: image),
    ]);

    final response =
    await sendMessageUseCase(text: text, image: image);

    emit([
      ...state,
      ChatMessageEntity(text: response, isUser: false),
    ]);
  }
}
