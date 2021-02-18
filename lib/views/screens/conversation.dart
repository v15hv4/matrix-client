import 'package:bleep/models/room.dart';
import 'package:bleep/views/widgets/empty_appbar.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final RoomModel room;
  Conversation({this.room});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        body: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(children: <Widget>[
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back)),
                ),
              ),
            ])));
  }
}
