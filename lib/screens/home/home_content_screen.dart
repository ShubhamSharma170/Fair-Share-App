import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
// import 'package:fair_share/screens/create%20group/create_group_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: splashbackgroundColor,
          actions: [
            IconButton(
              onPressed: () async {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //       builder: (context) => const CreateGroupScreen(),
                //     ));
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.group_add_outlined, color: whiteColor),
            )
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("No Groups to display",
                style: TextStyle(color: whiteColor, fontSize: 20)),
            sizedBoxH20,
            InkWell(
              hoverColor: whiteColor,
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.group_add_outlined, color: whiteColor),
                      sizedBoxW10,
                      Text("Start a new group",
                          style: TextStyle(color: whiteColor, fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: SizedBox(
          width: 120,
          height: 50,
          child: FloatingActionButton(
            isExtended: true,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add Expenses",
                  style: TextStyle(color: splashbackgroundColor)),
            ),
          ),
        ),
      ),
    );
  }
}
