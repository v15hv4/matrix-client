class MessageModel {
  final String id;
  final String text;
  final String sender;
  final int ts;

  MessageModel({this.id, this.text, this.sender, this.ts});

  factory MessageModel.fromJson(final json) {
    return MessageModel(id: "0", text: "hi there", sender: "@sender", ts: 1620);
  }
}
