import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final DateTime date;
  final String username;

  const MessageWidget(this.message, this.date, this.username);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: username == 'okello' ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
          child : Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350]!,
                            blurRadius: 2.0,
                            offset: Offset(0, 1.0))
                      ],
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: Card(
                    color: username == 'okello' ? Colors.green[300] : Colors.grey[700],
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: username == 'okello' ? Radius.circular(0) : Radius.circular(10),
                        topLeft: username == 'okello' ? Radius.circular(10) : Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('${username == 'okello'}'),
                          username != 'okello' ?
                          Text(username, style: theme.textTheme.bodyText1!.copyWith(fontSize: 18),) : SizedBox.shrink(),
                          Text(message, style: theme.textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 16),),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  DateFormat('kk:mma').format(date).toString(),
                                  style: TextStyle(color: Colors.grey),
                                )),
                          // ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
      ),
    );
  }
}