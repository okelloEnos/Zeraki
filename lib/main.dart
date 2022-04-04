import 'package:beamer/beamer.dart';
import 'package:communication/blocs/bottom_nav/bottom_nav_bloc.dart';
import 'package:communication/screen/chat/groups_screen.dart';
import 'package:communication/screen/code/code_screen.dart';
import 'package:communication/screen/dashboard/dashboard.dart';
import 'package:communication/screen/login_screen.dart';
import 'package:communication/screen/profile/profile_screen.dart';
import 'package:communication/util/colors_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider<BottomNavigationBloc>(
    create: (context){
      return BottomNavigationBloc();
    },
    child: CommunicationApp(),
  ));
}

class CommunicationApp extends StatelessWidget {
  CommunicationApp({Key? key}) : super(key: key);

  final routeDelegate = BeamerDelegate(
      initialPath: '/',
      locationBuilder: SimpleLocationBuilder(routes: {
        '/': (context) => LogInScreen(),
        '/code': (context) => CodeScreen(),
        '/groups': (context) {
          final beamState = context.currentBeamLocation.state;
          final userName = beamState.data['username'] ;
          final eMail = beamState.data['email'] ;
          return GroupsScreen(email: eMail, userName: userName,);
        },
        '/dashboard': (context) {
          final beamState = context.currentBeamLocation.state;
          final groupCode = beamState.data['groupCode'] ;
          final groupName = beamState.data['groupName'] ;
          final userName = beamState.data['username'] ;
          final eMail = beamState.data['email'] ;
          return DashBoard(groupCode: groupCode, groupName: groupName, email: eMail, userName: userName,);
        },
        '/dashboard/profile': (context) {
          final beamState = context.currentBeamLocation.state;
          final userName = beamState.data['username'] ;
          final eMail = beamState.data['email'] ;
          return ProfileScreen(userName: userName, email: eMail,);
        }
      }));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      routerDelegate: routeDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
