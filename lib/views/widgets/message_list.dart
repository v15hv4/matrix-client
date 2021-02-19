// import 'package:bleep/api/messages.dart';
import 'package:bleep/api/messages.dart';
import 'package:bleep/models/message.dart';
import 'package:bleep/models/room.dart';
import 'package:bleep/views/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final RoomModel room;
  MessageList({this.room});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MessageModel>>(
        future: getMessages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            reverse: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return MessageBubble(snapshot.data[index]);
            },
          );
        });
  }
}
