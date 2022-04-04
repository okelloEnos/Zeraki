import 'package:beamer/beamer.dart';
import 'package:communication/util/codes_list.dart';
import 'package:flutter/material.dart';

class CodeScreen extends StatelessWidget {
  CodeScreen({Key? key}) : super(key: key);
  List<Group> groupCodes = [];

  @override
  Widget build(BuildContext context) {
    groupCodes.add(Group(groupCode: '1', groupName: 'Computer'));
    groupCodes.add(Group(groupCode: '2', groupName: 'Engineering'));
    groupCodes.add(Group(groupCode: '3', groupName: 'Nursing'));
    groupCodes.add(Group(groupCode: '4', groupName: 'Education'));
    return
      Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(''),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: groupCodes.length,
            itemBuilder: (context, index){
            var codeGroup = groupCodes[index];
              return GestureDetector(
                onTap: (){
              context.beamToNamed('/dashboard', data: {'groupCode': codeGroup.groupCode});
            },
              child: codeCard(codeGroup));
            }),
      );
  }
}
// context.beamToNamed('/dashboard');
Widget codeCard(Group group){
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(group.groupCode),
              Text(group.groupName)
            ],
          ),
        ),
      ),
  );
}

