import 'package:flutter/material.dart';

class RescuerMessage extends StatefulWidget {
  @override
  _RescuerMessageState createState() => _RescuerMessageState();
}
class _RescuerMessageState extends State<RescuerMessage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = []; // Start with an empty list of messages

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 117, 192),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Redirect to WaitingPage when back icon is clicked
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: Text(
            "Rescuer Name", // Change to dynamic name if needed
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          // Display messages in the chat
          Expanded(
            child: ListView.builder(
              reverse: true, // To show the latest message at the bottom
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isSender = index % 1 == 0; // Simulate user and rescuer messages
                return _buildMessageBubble(messages[index], isSender);
              },
            ),
          ),
          // Blue lower section with white outlined message input area
          Container(
            color: Color.fromARGB(255, 25, 117, 192),
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.white),
                  onPressed: () {
                    // Handle attach file functionality
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: " Type a message...",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      String userMessage = _messageController.text;
                      setState(() {
                        // Add user message to the list
                        messages.insert(0, userMessage);
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
