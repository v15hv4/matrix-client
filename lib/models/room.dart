class RoomModel {
  final String name;
  final String id;
  final int unread;
  final String lastSender;
  final String lastMessage;
  final int lastTS;

  RoomModel(
      {this.id,
      this.name,
      this.unread,
      this.lastSender,
      this.lastMessage,
      this.lastTS});

  factory RoomModel.fromJson(final id, final json) {
    int unread = json["org.matrix.msc2654.unread_count"];
    List timeline = json["timeline"]["events"]
        .where((e) => e["type"] == "m.room.message")
        .toList();
    String lastSender =
        timeline[timeline.length - 1]["sender"].split(":")[0].substring(1);
    String lastMessage = timeline[timeline.length - 1]["content"]["body"];
    int lastTS = timeline[timeline.length - 1]["origin_server_ts"];
    String name = "";

    try {
      name = json["state"]["events"]
          .where((e) => e["type"] == "m.room.name")
          .toList()[0]["content"]["name"];
    } catch (e) {
      name = json["timeline"]["events"]
          .where((e) => e["type"] == "m.room.name")
          .toList()[0]["content"]["name"];
    }
    return RoomModel(
        id: id,
        name: name,
        unread: unread,
        lastSender: lastSender,
        lastMessage: lastMessage,
        lastTS: lastTS);
  }
}
