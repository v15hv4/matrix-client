import 'package:bleep/api/rooms.dart';
import 'package:bleep/models/room.dart';
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
    return FutureBuilder<List<RoomModel>>(
        future: getRooms(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (context, index) {
              if (index == snapshot.data.length) {
                return SizedBox(height: 50.0);
              }
              return RoomItem(index, snapshot.data[index]);
            },
          );
        });
  }
}
