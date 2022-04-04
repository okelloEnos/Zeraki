import 'package:beamer/src/beamer.dart';
import 'package:communication/data/group_dao.dart';
import 'package:communication/data/group_model.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  GroupsScreen({Key? key, required this.email, required this.userName}) : super(key: key);
  final String? userName;
  final String email;
  final groupDao = GroupDao();

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getGroupList(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Flexible(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //         child: TextField(
            //           keyboardType: TextInputType.text,
            //           controller: _messageController,
            //           onChanged: (text) => setState(() {}),
            //           onSubmitted: (input) {
            //             _sendMessage();
            //           },
            //           decoration:
            //           const InputDecoration(hintText: 'Enter new message'),
            //         ),
            //       ),
            //     ),
            //     // IconButton(
            //     //     icon: Icon(_canSendMessage()
            //     //         ? CupertinoIcons.arrow_right_circle_fill
            //     //         : CupertinoIcons.arrow_right_circle),
            //     //     onPressed: () {
            //     //       _sendMessage();
            //     //     })
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // void _sendMessage() {
  //   if (_canSendMessage()) {
  //     // final message = Message(_messageController.text, DateTime.now());
  //     final message = Message(_messageController.text, '01/02/2022');
  //     widget.messageDao.saveMessage(message, widget.group);
  //     _messageController.clear();
  //     setState(() {});
  //   }
  // }
  //
  // bool _canSendMessage() => _messageController.text.length > 0;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  Widget _getGroupList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.groupDao.getGroupsQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          print('ffffffffffffffff :: ${snapshot.value}');
          final json = snapshot.value;
          // as Map<String, String>;
          final group = GroupCodes.fromJson(json);
          return GestureDetector(
              onTap: (){
                context.beamToNamed('/dashboard', data: {'groupCode': group.groupCode, 'groupName': group.groupName,
                  'username': widget.userName, 'email': widget.email});
              },
              child: groupCard(group));
        },
      ),
    );
  }

  Widget groupCard(GroupCodes group){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        color: Colors.teal[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(group.groupCode, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              Text(group.groupName, style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }
}