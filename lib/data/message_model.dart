class Message {
  final String text;
  final DateTime date;
  final String username;
  // final String date;

  Message(this.text, this.date, this.username);


  Message.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
  username = json['username'] as String,
      // : date = json['date'] as String,
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'date': date.toString(),
    'username': username,
    'text': text,
  };

}
