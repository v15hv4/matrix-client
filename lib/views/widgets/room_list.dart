import 'package:bleep/views/widgets/room_item.dart';
import 'package:flutter/material.dart';

class RoomList extends StatefulWidget {
  // final Future<List<Room>> roomItems;
  // final Function updateRoomList;
  // RoomList(this.roomItems, this.updateRoomList);

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    final snapshot = {
      "data": [
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": true
        },
        {
          "title": "Subtitle 2",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": true
        },
        {
          "title": "Subtitle 3",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 4",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 5",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 6",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": false
        },
        {
          "title": "Subtitle 1",
          "last_message": {"content": "something", "timestamp": DateTime.now()},
          "unread": true
        },
      ]
    };

    // return FutureBuilder(
    //     future: widget.roomItems,
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {
    //         return Center(child: CircularProgressIndicator());
    //       }

    //     });

    return ListView.builder(
      itemCount: snapshot["data"].length + 1,
      itemBuilder: (context, index) {
        if (index == snapshot["data"].length) {
          return SizedBox(height: 50.0);
        }
        return RoomItem(index, snapshot["data"][index]);
      },
    );
  }
}
