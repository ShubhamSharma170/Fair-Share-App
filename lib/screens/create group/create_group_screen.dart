import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/constants/contant_value.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        appBar: AppBar(
          backgroundColor: splashbackgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: whiteColor)),
          title:
              const Text("Create Group", style: TextStyle(color: whiteColor)),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text("Done",
                    style: TextStyle(color: whiteColor, fontSize: 15)),
              ),
            )
          ],
        ),
        body: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: grey373a3f, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(Icons.camera_alt_outlined,
                    color: whiteColor, size: 40),
              ),
            ),
            sizedBoxW15,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Group Name",
                      style: TextStyle(fontSize: 15, color: whiteColor)),
                  Container(
                    height: 50,
                    width: width * .5,
                    child: TextField(),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
