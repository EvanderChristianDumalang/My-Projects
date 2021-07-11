import 'package:flutter/material.dart';
import 'package:screentest1/choice.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nama = "";
  var _usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: "Masukkan Nama",
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.name,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(Choice(),
                      arguments: {'name': _usernameController.text});
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
