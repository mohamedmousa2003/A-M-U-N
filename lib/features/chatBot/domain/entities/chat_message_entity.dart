import 'dart:io';

class ChatMessageEntity {
  final String text;
  final bool isUser;
  final File? image;

  ChatMessageEntity({
    required this.text,
    required this.isUser,
    this.image,
  });
}
