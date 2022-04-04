class GroupCodes {
  final String groupCode;
  final String groupName;

  GroupCodes(this.groupCode, this.groupName);


  GroupCodes.fromJson(Map<dynamic, dynamic> json)
      // : date = DateTime.parse(json['date'] as String),
      : groupCode = json['code'] as String,
        groupName = json['name'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'code': groupCode,
    'text': groupName,
  };

}
