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

  factory Note.fromMap(Map<String, dynamic> map) { //Fatching data in map
    return Note(
      id: map["id"],
        userid: map["userid"],
        title: map["title"],
        content: map["content"],
        dateadded: DateTime.parse(map["dateadded"]),
        //should be try parse
    );
  }
  Map<String, dynamic> toMap() {
    //Entering the data in map
   //data which we are going to fetch is going to store in this toMap
    return {
      //key : value
      "id": id,
      "userid": userid,
      "title": title,
      "content": content,
      "dateadded": dateadded.toIso8601String(),
    };
  }
}

