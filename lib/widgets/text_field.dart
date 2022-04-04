import 'package:flutter/material.dart';

Widget customTextField({required IconData firstIcon,
    required TextEditingController controller, required String text,
  required bool showSuffix, required Color color, required bool hideText

    }) => Padding(padding: const EdgeInsets.only(left: 0, right: 0),

  child:  TextField(
    obscureText: hideText,
    enabled: true,
    obscuringCharacter: '*',
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        prefixIcon: Icon(firstIcon, color: color,),
        suffixIcon: showSuffix ?  GestureDetector(
              onTap: () {
                  // ref.read(showOrHide).state = !hideText;

              },
              child: hideText ? Icon(Icons.visibility_off_outlined, color: color,)
                  : Icon(Icons.visibility_outlined, color: color,)
          )
         : const SizedBox.shrink(),
        labelText: text,
        hintStyle: const TextStyle(color: Colors.grey,),
        errorStyle: const TextStyle(color: Colors.red,),
        labelStyle:  TextStyle(color: color,),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color
            )
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: color
            )
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: color
            )
        )
    ),
  ),);