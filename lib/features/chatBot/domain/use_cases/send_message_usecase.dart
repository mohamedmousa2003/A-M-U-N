import 'dart:io';
import '../repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<String> call({
    required String text,
    File? image,
  }) {
    if (image != null) {
      return repository.sendTextWithImage(text, image);
    } else {
      return repository.sendText(text);
    }
  }
}
