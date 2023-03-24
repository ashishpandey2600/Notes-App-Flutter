class Note {
  String id;
  String userid;
  String title;
  String content;
  DateTime dateadded;

  Note(
      {required this.id,
      required this.userid,
      required this.title,
      required this.content,
      required this.dateadded});

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"],
        userid: map["userid"],
        title: map["titile"],
        content: map["content"],
        dateadded: DateTime.parse(map["dateadded"]),
        //should be try parse
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userid": userid,
      "title": title,
      "content": content,
      "dateadded": dateadded.toIso8601String(),
    };
  }
}
