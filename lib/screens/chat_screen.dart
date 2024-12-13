import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FocusNode _focusNode; // Declare FocusNode here

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(); // Initialize in initState
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose in dispose
    super.dispose();
  }

  final List<Map<String, dynamic>> _messages = [
    {
      'text':
          'Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry\'s Standard Dummy Text Ever Since The 1500s, When An Unknown Printer Took.',
      'isSender': false
    },
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': true},
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': false},
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': true},
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': false},
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': true},
    {'text': 'Lorem Ipsum Is Simply Dummy', 'isSender': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              "lib/assets/msg_logo.png",
              width: 30,
              height: 30,
            ),
            // Icon(Icons.chat_bubble_outline, color: Colors.teal),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('JOHN DOE',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Text('Online',
                    style: TextStyle(color: Colors.purple, fontSize: 15)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          // _buildMessageInput(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          // Make FAB rounded
          borderRadius: BorderRadius.circular(25), // Adjust radius as needed
        ),
        onPressed: () {},
        backgroundColor: Color(0xFF9C1EC2),
        child: Image.asset(
          "lib/assets/msg_logo.png",
          width: 30,
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  // Request focus on a dummy FocusNode to trigger the keyboard.
                  FocusScope.of(context).requestFocus(_focusNode);

                  // Show the keyboard explicitly (for some platforms/situations).
                  SystemChannels.textInput.invokeMethod('TextInput.show');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              // Spacer for FAB
              const SizedBox(width: 40),
              // Profile Button
              MaterialButton(
                minWidth: 40,
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purple,
      //   onPressed: () {},
      //   child: const Icon(Icons.chat, color: Colors.white),
      // ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isSender = message['isSender'] ?? false; // Provide a default value
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        //Added Padding for Spacing from side
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize:
              MainAxisSize.min, // Important: Use min for proper alignment
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isSender) // Show avatar only for receiver
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "lib/assets/msg_logo.png",
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            Flexible(
              //Use Flexible to avoid overflow
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: isSender ? Colors.white : Color(0xFF122E57),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                    bottomLeft:
                        isSender ? const Radius.circular(15) : Radius.zero,
                    bottomRight:
                        isSender ? Radius.zero : const Radius.circular(15),
                  ),
                  boxShadow: [
                    if (isSender)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Text(
                  message['text'] ?? "", // Provide a default value
                  style: TextStyle(
                    color: isSender ? Colors.black : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            if (isSender) // Show avatar only for sender
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: const Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.purple,
            child: const Icon(Icons.send, color: Colors.white),
            mini: true,
          ),
        ],
      ),
    );
  }
}
