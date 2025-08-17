import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black), // back arrow color
        title: Text(
          info[0]['name'].toString(),
          style: const TextStyle(color: Colors.black), // text color black
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: ChatList()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.black), // typed text black
              decoration: InputDecoration(
                filled: true,
                fillColor: senderMessageColor,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(Icons.emoji_emotions, color: Colors.black),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.camera_alt, color: Colors.black),
                      SizedBox(width: 10),
                      Icon(Icons.attach_file, color: Colors.black),
                      SizedBox(width: 10),
                      Icon(Icons.money, color: Colors.black),
                    ],
                  ),
                ),
                hintText: 'Type a message!',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ), // hint text grey
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
