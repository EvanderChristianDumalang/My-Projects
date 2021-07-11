import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screentest1/choice.dart';
import 'package:screentest1/guestdata.dart';

class Guest extends StatefulWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  List<GuestData> _list = [];
  var loading = false;
  Future<Null> _fetchGuest() async {
    setState(() {
      loading = true;
    });
    final response = await http
        .get(Uri.parse("http://www.mocky.io/v2/596dec7f0f000023032b8017"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(GuestData.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchGuest();
  }

  @override
  Widget build(BuildContext context) {
    String event = Get.arguments['event'] ?? 'Pilih Event';
    String name = Get.arguments['name'];
    return Scaffold(
        appBar: AppBar(
          title: Text("Event"),
        ),
        body: Center(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int i) {
                      final x = _list[i];
                      return Center(
                          child: Card(
                              child: ElevatedButton(
                        onPressed: () {
                          List<String> split = x.birthdate.split("-");
                          int birth = int.parse(split[2]);
                          if (birth % 2 == 0 && birth % 3 == 0) {
                            Get.defaultDialog(
                              title: "Alert!!",
                              middleText: "IOS",
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.black),
                              middleTextStyle: TextStyle(color: Colors.black),
                              textConfirm: "Ok",
                              onConfirm: () {
                                Get.back(result: true);
                                Get.to(Choice(), arguments: {
                                  'name': name,
                                  'guest': x.name,
                                  'event': event
                                });
                              },
                            );
                          } else if (birth % 2 == 0) {
                            Get.defaultDialog(
                              title: "Alert!!",
                              middleText: "Blackberry",
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.black),
                              middleTextStyle: TextStyle(color: Colors.black),
                              textConfirm: "Ok",
                              onConfirm: () {
                                Get.back(result: true);
                                Get.to(Choice(), arguments: {
                                  'name': name,
                                  'guest': x.name,
                                  'event': event
                                });
                              },
                            );
                          } else if (birth % 3 == 0) {
                            Get.defaultDialog(
                              title: "Alert!!",
                              middleText: "Android",
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.black),
                              middleTextStyle: TextStyle(color: Colors.black),
                              textConfirm: "Ok",
                              onConfirm: () {
                                Get.back(result: true);
                                Get.to(Choice(), arguments: {
                                  'name': name,
                                  'guest': x.name,
                                  'event': event
                                });
                              },
                            );
                          } else {
                            Get.defaultDialog(
                              title: "Alert!!",
                              middleText: "Phone Feature",
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.black),
                              middleTextStyle: TextStyle(color: Colors.black),
                              textConfirm: "Ok",
                              onConfirm: () {
                                Get.back(result: true);
                                Get.to(Choice(), arguments: {
                                  'name': name,
                                  'guest': x.name,
                                  'event': event
                                });
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 1000,
                          width: 75,
                          child: Column(
                            children: [
                              Image.asset('assets/images/people.png'),
                              Text(x.name),
                              Text(x.birthdate)
                            ],
                          ),
                        ),
                      )));
                    },
                  )));
  }
}
