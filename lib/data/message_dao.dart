import 'package:firebase_database/firebase_database.dart';
import 'message_model.dart';

class MessageDao {
  final DatabaseReference _messagesRef =
  FirebaseDatabase.instance.reference().child("chats");

  void saveMessage(Message message, String group) {
    _messagesRef.child(group).push().set(message.toJson());
  }

  Query getMessageQuery(String groupCode) {
    return _messagesRef.child(groupCode);
  }

}

