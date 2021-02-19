import 'package:bleep/models/message.dart';
import 'common.dart';

Future<List<MessageModel>> getMessages() async {
  return [
    MessageModel.fromJson({"outgoing": true}),
    MessageModel.fromJson({"outgoing": true}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": true}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": true}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": true}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": false}),
    MessageModel.fromJson({"outgoing": false}),
  ];
}
