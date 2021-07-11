import 'package:flutter/material.dart';
import 'package:screentest2/choice.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String nama = "";
 
  static bool isPalindrome(String nama) {
    int i = 0, j = nama.length - 1;

    while (i < j) {
      if (nama[i] != nama[j]) return false;

      i++;
      j--;
    }
    return true;
  }
  
  var _usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/BG.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Sertakan gambar profil Anda untuk melengkapi profil.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Container(
                  height: 150,
                  width: 150,
                  child: TextButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      side: BorderSide(color: Colors.white)))),
                      onPressed: () {},
                      child:
                          Image(image: AssetImage('assets/images/Add.png')))),
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
                validator: (val) {
                  try {
                    if (isPalindrome(val!)) {
                      return "isPalindrome";
                    } else {
                      return "not palindrome";
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                onChanged: (val) {
                  setState(() => nama = val);
                },
                keyboardType: TextInputType.name,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Container(
                width: 400,
                height: 60,
                child: TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.white)))),
                    onPressed: () {
                      Get.to(Choice(),
                          arguments: {'name': _usernameController.text});
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
