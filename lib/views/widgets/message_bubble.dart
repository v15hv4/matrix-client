import 'package:bleep/models/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  MessageBubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment:
          message.outgoing ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          child: Container(
            decoration: BoxDecoration(
                color: message.outgoing ? Colors.grey[900] : Colors.grey[300],
                borderRadius: BorderRadius.circular(6)),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              children: [
                !message.outgoing
                    ? (Container(
                        width: 80.0 + 2 * message.text.length,
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(message.sender.substring(1),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ))
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                Container(
                  width: 80.0 + 2 * message.text.length,
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(message.text,
                      style: TextStyle(
                          color:
                              message.outgoing ? Colors.white : Colors.black)),
                ),
                Container(
                  width: 80.0 + 2 * message.text.length,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 1.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("${message.ts}",
                        style: TextStyle(
                            color: message.outgoing
                                ? Colors.grey[400]
                                : Colors.grey[700],
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
