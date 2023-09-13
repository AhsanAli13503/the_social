class MessageModel{

  String? text;
  String? sender;
  bool? seen;
  DateTime? createdAt;

  MessageModel({this.text, this.sender, this.seen, this.createdAt});

  MessageModel.fromMap(Map<String, dynamic> map) {
    text = map["text"];
    sender = map["sender"];
    seen = map["seen"];
    createdAt = map["createdAt"];
  }

  Map<String, dynamic> toMap(){
    return {
      "text": text,
      "sender": sender,
      "seen": seen,
      "createdAt": createdAt,
    };
  }


}