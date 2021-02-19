import 'package:bleep/models/room.dart';
import 'package:bleep/views/widgets/empty_appbar.dart';
import 'package:bleep/views/widgets/message_list.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final RoomModel room;
  Conversation({this.room});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              SizedBox(
                  height: 60,
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.chevron_left,
                            size: 32,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.room.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                    )
                  ])),
              Expanded(child: SizedBox(child: MessageList(room: widget.room))),
              Container(
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[300]))),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.send),
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: "Type a message...",
                        contentPadding: EdgeInsets.all(16)),
                  ))
            ])));
  }
}
