// import 'package:communication/data/message_model.dart';
// import 'package:communication/widgets/message_widget.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat Screen'),
//       ),
//       body: const Center(child:  Text('Chat Screen')),
//     );
//   }
//
//   Widget _getMessageList() {
//     return Expanded(
//       child: FirebaseAnimatedList(
//         controller: _scrollController,
//         query: widget.messageDao.getMessageQuery(),
//         itemBuilder: (context, snapshot, animation, index) {
//           final json = snapshot.value as Map<dynamic, dynamic>;
//           final message = Message.fromJson(json);
//           return MessageWidget(message.text, message.date);
//         },
//       ),
//     );
//   }
//
// }
