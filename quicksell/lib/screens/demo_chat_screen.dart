import 'package:flutter/material.dart';

class DemoChatScreen extends StatefulWidget {
  const DemoChatScreen({super.key});

  @override
  State<DemoChatScreen> createState() => _DemoChatScreenState();
}

class _DemoChatScreenState extends State<DemoChatScreen> {
  final _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hi! Is this still available?',
      'isMe': true,
    },
    {
      'text': 'Yes it is! Come pick it up anytime.',
      'isMe': false,
    },
    {
      'text': 'Great! Can you do a lower price?',
      'isMe': true,
    },
    {
      'text': 'I can do a small discount for you.',
      'isMe': false,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': _messageController.text.trim(),
        'isMe': true,
      });
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(product['name']!,
            style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.orange[50],
            child: Row(
              children: [
                const Icon(Icons.shopping_bag, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name']!,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$${product['price']}',
                          style:
                              const TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'] as bool;
                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.orange : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['text'] as String,
                      style: TextStyle(
                          color: isMe ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}