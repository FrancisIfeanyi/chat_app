import 'package:flutter/material.dart';

import 'package:chatup_app/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${entity.text}',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              if (entity.imageUrl != null)
                Image.asset(
                  '${entity.imageUrl}',
                  height: 50,
                  width: 50,
                ),
            ],
          ),
          margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
          )),
    );
  }
}
