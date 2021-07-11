import 'package:flutter/material.dart';
import 'package:screentest2/choice.dart';
import 'package:get/get.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  String a = "Event A";
  String b = "Event B";
  String c = "Event C";
  String d = "Event D";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/images/ButtonBack.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Event",
          style: TextStyle(color: Colors.amberAccent),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.amberAccent,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/images/ButtonMedia.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
          child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              
              ),
              child: ListTile(
                title: Text(
                  a,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('15 Sept 2014'),
                trailing: SizedBox(
                  child: Image.asset('assets/images/a.png'),
                ),
                onTap: () {
                  Get.to(Choice(), arguments: {
                    'name': Get.arguments['name'],
                    'event': a,
                    'guest': Get.arguments['guest']
                  });
                },
              ),
            ),
            Container(
              height: 100,
              width: 450,
              child: ListTile(
                title: Text(
                  b,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('17 Aug 2014'),
                trailing: SizedBox(
                  child: Image.asset('assets/images/b.png'),
                ),
                onTap: () {
                  Get.to(Choice(), arguments: {
                    'name': Get.arguments['name'],
                    'event': b,
                    'guest': Get.arguments['guest']
                  });
                },
              ),
            ),
            Container(
              height: 100,
              width: 450,
              child: ListTile(
                title: Text(
                  c,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('16 Sept 2014'),
                trailing: SizedBox(
                  child: Image.asset('assets/images/c.png'),
                ),
                onTap: () {
                  Get.to(Choice(), arguments: {
                    'name': Get.arguments['name'],
                    'event': c,
                    'guest': Get.arguments['guest']
                  });
                },
              ),
            ),
            Container(
              height: 100,
              width: 450,
              child: ListTile(
                title: Text(
                  d,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('16 Aug 2014'),
                trailing: SizedBox(
                  child: Image.asset('assets/images/d.png'),
                ),
                onTap: () {
                  Get.to(Choice(), arguments: {
                    'name': Get.arguments['name'],
                    'event': d,
                    'guest': Get.arguments['guest']
                  });
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
