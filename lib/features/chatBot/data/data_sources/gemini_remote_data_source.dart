import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiRemoteDataSource {
  final Gemini gemini;

  GeminiRemoteDataSource(this.gemini);

  /// TEXT ONLY
  Future<String> sendText(String text) async {
    final response = await gemini.text(text);
    return response?.output ?? "No response";
  }

  /// TEXT + IMAGE (FINAL FIX – NO ERRORS)
  Future<String> sendTextWithImage(String text, File image) async {
    final Candidates? response = await gemini.textAndImage(
      text: text,
      images: [image.readAsBytesSync()],
    );

    return response?.output ?? "No response";
  }
}
