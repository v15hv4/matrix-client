import 'dart:convert';

import 'package:bleep/models/room.dart';
import 'package:http/http.dart' as http;

import 'common.dart';

Future<List<RoomModel>> getRooms() async {
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
