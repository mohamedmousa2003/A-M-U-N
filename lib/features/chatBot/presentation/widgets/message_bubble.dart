import 'dart:io';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isUser;
  final String text;
  final File? image;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (image != null)
            Container(
              height: 200,
              width: 250,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(image!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isUser ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
