import 'package:bleep/models/room.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomItem extends StatelessWidget {
  final int index;
  final RoomModel room;
  RoomItem(this.index, this.room);

  @override
  Widget build(BuildContext context) {
    final lastTS = new DateTime.fromMillisecondsSinceEpoch(room.lastTS);
    final formattedTS = DateFormat("kk:mm\ndd MMM").format(lastTS);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: new BoxDecoration(
            border:
                new Border(bottom: new BorderSide(color: Colors.grey[300]))),
        child: ListTile(
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(formattedTS,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12))
            ],
          ),
          title: Text(room.name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              )),
          subtitle: Text("${room.lastSender}: ${room.lastMessage}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              )),
          onTap: () => null,
        ),
      ),
    );
  }
}
