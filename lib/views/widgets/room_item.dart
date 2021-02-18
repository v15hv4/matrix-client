import 'package:bleep/models/room.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  final int index;
  final RoomModel room;
  RoomItem(this.index, this.room);

  @override
  Widget build(BuildContext context) {
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
              Text("${room.lastTS}",
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
