class MessageModel {
  final String id;
  final String text;
  final String sender;
  final int ts;
  final bool outgoing;

  MessageModel({this.id, this.text, this.sender, this.ts, this.outgoing});

  factory MessageModel.fromJson(final json, final currentUserId) {
    String text = json["content"]["body"];
    String senderId = json["sender"];
    String sender = senderId.split(":")[0];
    int ts = json["origin_server_ts"];
    return MessageModel(
        id: "0",
        text: text,
        sender: sender,
        ts: ts,
        outgoing: senderId == currentUserId);
  }
}
