import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  final int index;
  final Map<String, dynamic> room;
  RoomItem(this.index, this.room);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        decoration: new BoxDecoration(
            border:
                new Border(bottom: new BorderSide(color: Colors.grey[300]))),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.group,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("yesterday",
                  style: TextStyle(color: Colors.grey[500], fontSize: 12))
            ],
          ),
          title: Text(room["title"],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )),
          subtitle: Text(room["title"],
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
