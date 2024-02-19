import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:groupchat/ChatBot/api_key.dart';
import 'package:groupchat/pages/select%20page/select_page.dart';
import 'package:http/http.dart' as http;

class ChatGPTScreen extends StatefulWidget {
  const ChatGPTScreen({Key? key}) : super(key: key);

  @override
  _ChatGPTScreenState createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<ChatGPTScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  // Define color variables
  static const Color appBarBackgroundColor = Color.fromARGB(255, 42, 44, 46);
  static const Color appBarTextColor = Colors.white;
  static const Color userBubbleColor = Color.fromARGB(0, 245, 245, 245);
  static const Color botBubbleColor = Color.fromARGB(0, 119, 126, 53);
  static const Color roleBackgroundColor = Color.fromARGB(255, 137, 177, 210);
  static const Color chatBackgroundColor = Color.fromARGB(255, 238, 233, 233);
  static const Color sendButtonColor = Color.fromARGB(255, 25, 26, 27);

  void onSendMessage() async {
    Message message = Message(text: _textEditingController.text, isMe: true);
    _textEditingController.clear();

    setState(() {
      _messages.insert(0, message);
    });

    String response = await sendMessageToChatGpt(message.text);

    Message chatGpt = Message(text: response, isMe: false);

    setState(() {
      _messages.insert(0, chatGpt);
    });
  }

  Future<String> sendMessageToChatGpt(String message) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": message}],
      "max_tokens": 500,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${APIKey.apiKey}",
      },
      body: json.encode(body),
    );

    print(response.body);

    Map<String, dynamic> parsedResponse = json.decode(response.body);

    String reply = parsedResponse['choices'][0]['message']['content'];

    return reply;
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: message.isMe
          ? const EdgeInsets.only(top: 5.0, bottom: 8.0, left: 110.0)
          : const EdgeInsets.only(top: 5.0, bottom: 8.0, right: 80.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: message.isMe ? userBubbleColor : botBubbleColor,
        borderRadius: message.isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              color: roleBackgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              message.isMe ? 'You 👤' : 'ChatBot 🤖',
              style: const TextStyle(
                color: Color.fromARGB(255, 28, 28, 28),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: chatBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(0, 36, 37, 38)),
            ),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Color.fromARGB(255, 36, 37, 38),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appBarTextColor),
        title: const Text(
          'Brain Wave Bot',
          style: TextStyle(color: appBarTextColor),
        ),
        backgroundColor: appBarBackgroundColor,
        titleTextStyle: const TextStyle(
          color: appBarTextColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectPage()),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.9,
            image: AssetImage('assets/images/chat4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),
            const Divider(
              height: 1.0,
              color: Color.fromARGB(0, 152, 183, 213),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: chatBackgroundColor,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Color.fromARGB(0, 82, 78, 78)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 5.0, left: 30.0, right: 10.0),
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: sendButtonColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: onSendMessage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
