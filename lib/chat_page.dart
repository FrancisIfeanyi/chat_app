import 'package:chatup_app/models/chat_message_entity.dart';
import 'package:chatup_app/widgets/chat_buble.dart';
import 'package:chatup_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    Key? key,
  }) : super(key: key);

  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        text: 'Hello l\'Professor, how are you today',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '182793',
        imageUrl: 'assets/logos/chatimage.png',
        author: Author(userName: 'GreatLord')),
    ChatMessageEntity(
        text: 'Hello l\'Professor',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '182793',
        author: Author(userName: 'Success')),
    ChatMessageEntity(
        text: 'Hi',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '182793',
        author: Author(userName: 'Success')),
    ChatMessageEntity(
        text: 'Hello l\'Professor, how are you today',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '182793',
        author: Author(userName: 'GreatLord')),
  ];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');
  List<ChatMessageEntity>
  
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    _loadInitialMessages();
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('hi $userName'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('icon pressed');
              },
              icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment:
                            _messages[index].author.userName == 'GreatLord'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
