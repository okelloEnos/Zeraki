import 'package:communication/blocs/bottom_nav/bottom_nav_bloc.dart';
import 'package:communication/blocs/bottom_nav/bottom_nav_events.dart';
import 'package:communication/screen/chat/chat_screen.dart';
import 'package:communication/screen/chat/message_view.dart';
import 'package:communication/screen/chat/messages.dart';
import 'package:communication/screen/chat/messages.dart';
import 'package:communication/screen/code/code_screen.dart';
import 'package:communication/screen/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  DashBoard({Key? key, required this.groupCode, required this.groupName, required this.userName, required this.email}) : super(key: key);
final String groupCode;
final String groupName;
  final String? userName;
  final String? email;


  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
      return BlocBuilder<BottomNavigationBloc, int>(
          builder: (context, state){
            // int currentIndex = state;
            return Scaffold(
              bottomNavigationBar: Container(
                decoration:  BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))
                ),
                child: BottomNavigationBar(
                  selectedItemColor: theme.primaryColor,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: const TextStyle(
                      color: Colors.grey
                  ),
                  onTap: (index){
                    // Map<String, int> selectedScreen = {'index' : index};
                    // context.beamToNamed('/dashBoardScreens', data: selectedScreen);
                    BlocProvider.of<BottomNavigationBloc>(context).add(TappingNavigation(navIndex: index));

                  },
                  // currentIndex: _currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.casino_outlined, color: state == 0 ? theme.primaryColor : Colors.grey,),
                      // ignore: deprecated_member_use
                      title: Text('Chat', style: TextStyle(color: state == 0 ? theme.primaryColor : Colors.grey,),),
                    ),
                    BottomNavigationBarItem(
                      icon:
                      Icon(Icons.person_outline, color: state == 1 ? theme.primaryColor : Colors.grey,),
                      // ignore: deprecated_member_use
                      title: Text('Profile', style: TextStyle(color: state == 1 ? theme.primaryColor : Colors.grey,),),
                    ),
                    // ),
                  ],
                ),
              ),
              // body: const DashBoardScreen(),
              // body: _children[state],
              body: state == 0 ?  MessagesView(groupCode: groupCode, groupName: groupName) : ProfileScreen(userName: userName, email: email),
            );
          });
    }

  }

