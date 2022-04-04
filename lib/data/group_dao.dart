import 'package:firebase_database/firebase_database.dart';

class GroupDao {
  final DatabaseReference _messagesRef =
  FirebaseDatabase.instance.reference().child("groups");

  // void saveMessage(Message message, String group) {
  //   _messagesRef.child(group).push().set(message.toJson());
  // }

  Query getGroupsQuery() {
    return _messagesRef;
  }

}