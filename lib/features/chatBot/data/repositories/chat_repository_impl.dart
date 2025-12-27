import 'dart:io';
import '../../domain/repositories/chat_repository.dart';
import '../data_sources/gemini_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final GeminiRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> sendText(String text) {
    return remoteDataSource.sendText(text);
  }

  @override
  Future<String> sendTextWithImage(String text, File image) {
    return remoteDataSource.sendTextWithImage(text, image);
  }
}
