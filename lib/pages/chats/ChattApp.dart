import 'package:flutter/material.dart';
import 'package:socially/styles/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration(
                filled: false,
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.backgroundColor,
        centerTitle: true,
        title: Text('Message'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action.
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action.
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: isUser ? Colors.deepPurple : Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            isUser ? 'You' : 'Other User',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
