import 'dart:convert';

import 'package:bleep/models/message.dart';
import 'package:http/http.dart' as http;

import 'common.dart';

Future<List<MessageModel>> getMessages(final room) async {
  Map<String, String> headers = {"Authorization": "Bearer $guestToken"};
  final url =
      "https://matrix.org/_matrix/client/r0/rooms/${room.id}/messages?dir=b&limit=100";
  final res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    final json = jsonDecode(res.body);
    final messageList =
        json["chunk"].where((e) => e["type"] == "m.room.message");

    List<MessageModel> messages = [];
    messageList.forEach((m) {
      messages = [...messages, MessageModel.fromJson(m, guestUserId)];
    });

    return messages;
  } else {
    throw Exception();
  }
}
