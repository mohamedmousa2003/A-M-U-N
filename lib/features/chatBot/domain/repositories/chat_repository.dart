import 'dart:io';
abstract class ChatRepository {
  Future<String> sendText(String text);
  Future<String> sendTextWithImage(String text, File image);
}
