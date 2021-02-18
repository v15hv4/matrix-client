import 'dart:convert';

import 'package:bleep/models/room.dart';
import 'package:bleep/views/widgets/room_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    // final snapshot = {
    //   "data": [
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": true
    //     },
    //     {
    //       "title": "Subtitle 2",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": true
    //     },
    //     {
    //       "title": "Subtitle 3",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 4",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 5",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 6",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": false
    //     },
    //     {
    //       "title": "Subtitle 1",
    //       "last_message": {"content": "something", "timestamp": DateTime.now()},
    //       "unread": true
    //     },
    //   ]
    // };

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

Future<List<RoomModel>> getRooms() async {
  String guestToken =
      "MDAxOGxvY2F0aW9uIG1hdHJpeC5vcmcKMDAxM2lkZW50aWZpZXIga2V5CjAwMTBjaWQgZ2VuID0gMQowMDJhY2lkIHVzZXJfaWQgPSBANTY0NDI2MTg1MjA6bWF0cml4Lm9yZwowMDE2Y2lkIHR5cGUgPSBhY2Nlc3MKMDAyMWNpZCBub25jZSA9IHpIMSNYMi5JUy4rV1FKLnUKMDAxNWNpZCBndWVzdCA9IHRydWUKMDAyZnNpZ25hdHVyZSCzbvdfMJhTgveGO0asKIt4nSCzU5KWqPHXgxD84tALZAo";

  Map<String, String> headers = {"Authorization": "Bearer $guestToken"};

  final url = "https://matrix.org/_matrix/client/r0/sync";
  final res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    final json = jsonDecode(res.body);
    final joinedRoomIds = json["rooms"]["join"];

    List<RoomModel> joinedRooms = [];
    joinedRoomIds.forEach((k, v) {
      joinedRooms = [...joinedRooms, RoomModel.fromJson(k, v)];
    });

    return joinedRooms;
  } else {
    throw Exception();
  }
}
