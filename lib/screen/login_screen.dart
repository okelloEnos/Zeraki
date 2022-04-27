import 'package:communication/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final idController = TextEditingController();
  final pinController = TextEditingController();
  final forgotPinController = TextEditingController();
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50.0),
              Text(
                'Login',
                style: theme.textTheme.headline5,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Kindly Use Email and Password Provided by Admin',
                style: theme.textTheme.headline6,
              ),
              const SizedBox(height: 30.0),
              customTextField(
                  firstIcon: Icons.mail_outline,
                  controller: idController,
                  text: "e Mail ",
                  showSuffix: false,
                  color: theme.primaryColor,
                  hideText: false,
              updateVisibility: visibilityUpdate),
              const SizedBox(
                height: 20.0,
              ),
              customTextField(
                  firstIcon: Icons.lock_outline_rounded,
                  controller: pinController,
                  text: "Password",
                  showSuffix: true,
                  color: theme.primaryColor,
                  hideText: visiblePassword,
              updateVisibility: visibilityUpdate),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Text(
                      'Forgot PIN ?',
                      style: theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              // isLoad && finishLoading ? Center(child: CircularProgressIndicator()) :
              Center(
                child: OutlinedButton(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    child: Text(
                      'Log In',
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  onPressed: () async{
                    // context.beamToNamed('/code');
                    User? user = await signInUsingEmailPassword(
                        email: idController.text.trim(),
                        password: pinController.text.trim(),
                        context: context
                    );
                    if (user != null) {
                      context.beamToNamed('/groups', data: {'username': user.displayName, 'email': user.email});
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void visibilityUpdate(){
   setState(() {
     visiblePassword = !visiblePassword;
   });
  }
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }
}

// class LogInScreen extends StatelessWidget {
//   LogInScreen({Key? key}) : super(key: key);
//
//   final idController = TextEditingController();
//   final pinController = TextEditingController();
//   final forgotPinController = TextEditingController();
//   bool visiblePassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 20.0, vertical: 40.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               const SizedBox(height: 50.0),
//               Text(
//                 'Login',
//                 style: theme.textTheme.headline5,
//               ),
//               const SizedBox(height: 10.0),
//              Text(
//                 'Kindly Use Email and Password Provided by Admin',
//                 style: theme.textTheme.headline6,
//               ),
//               const SizedBox(height: 30.0),
//               customTextField(
//                   firstIcon: Icons.mail_outline,
//                   controller: idController,
//                   text: "e Mail ",
//                   showSuffix: false,
//                   color: theme.primaryColor,
//                   hideText: false),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               customTextField(
//                   firstIcon: Icons.lock_outline_rounded,
//                   controller: pinController,
//                   text: "Password",
//                   showSuffix: true,
//                   color: theme.primaryColor,
//                   hideText: visiblePassword),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                     },
//                     child: Text(
//                       'Forgot PIN ?',
//                       style: theme.textTheme.headline6,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50.0,
//               ),
//               // isLoad && finishLoading ? Center(child: CircularProgressIndicator()) :
//               Center(
//                 child: OutlinedButton(
//
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
//                     child: Text(
//                       'Log In',
//                       style: theme.textTheme.headline6,
//                     ),
//                   ),
//                   onPressed: () async{
//                     // context.beamToNamed('/code');
//                     User? user = await signInUsingEmailPassword(
//                       email: idController.text,
//                       password: pinController.text,
//                       context: context
//                     );
//                     if (user != null) {
//                       context.beamToNamed('/groups', data: {'username': user.displayName, 'email': user.email});
//                     }
//                   },
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Future<User?> signInUsingEmailPassword({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//       }
//     }
//
//     return user;
//   }
//
// }
