import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screentest1/event.dart';
import 'package:screentest1/guest.dart';

class Choice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool isChanged = false;
  String event = "";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choice"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nama: "),
                  Text(Get.arguments['name'] ?? 'Empty'),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(Event(), arguments: {
                      'name': Get.arguments['name'],
                      'guest': Get.arguments['guest'],
                    });
                  },
                  child: Text(Get.arguments['event'] ?? "Pilih Event")),
              TextButton(
                  onPressed: () {
                    Get.to(Guest(), arguments: {
                      'name': Get.arguments['name'],
                      'event': Get.arguments['event']
                    });
                  },
                  child: Text(Get.arguments['guest'] ?? "Pilih Guest")),
            ],
          ),
        ),
      ),
    );
  }
}
