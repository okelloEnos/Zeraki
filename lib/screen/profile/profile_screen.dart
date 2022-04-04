import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String? userName;
  final String? email;
  const ProfileScreen({required this.userName, required this.email});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Profile'),
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.person, size: 100, color: Colors.teal,),
    Text(
    'E - Mail Address',
      style: Theme.of(context).textTheme.bodyText1,
    ),
    // SizedBox(height: 16.0),
    Text(
    '${widget.email}',
    style: Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 20
    ),
    ),
    SizedBox(height: 16.0),

    ],
    ),
    ),
    );
  }
}