import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:screentest2/choice.dart';
import 'package:screentest2/guestdata.dart';

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
      await DefaultCacheManager()
          .downloadFile('http://www.mocky.io/v2/596dec7f0f000023032b8017');
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  static bool isPrime(int n) {
    if (n <= 1) return false;

    for (int i = 2; i < n; i++) if (n % i == 0) return false;

    return true;
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
                : SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: WaterDropHeader(),
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus? mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text("pull up load");
                        } else if (mode == LoadStatus.loading) {
                          body = CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text("Load Failed!Click retry!");
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text("release to load more");
                        } else {
                          body = Text("No more Data");
                        }
                        return Container(
                          height: 55.0,
                          child: Center(child: body),
                        );
                      },
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: GridView.builder(
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
                            int month = int.parse(split[1]);
                            if (birth % 2 == 0 && birth % 3 == 0) {
                              Get.defaultDialog(
                                title: "IOS",
                                middleText: isPrime(month)
                                    ? 'Month Is Prime'
                                    : 'Month Is Not Prime',
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
                                title: "Blackberry",
                                middleText: isPrime(month)
                                    ? 'Month Is Prime'
                                    : 'Month Is Not Prime',
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
                                title: "Android",
                                middleText: isPrime(month)
                                    ? 'Month Is Prime'
                                    : 'Month Is Not Prime',
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
                                title: "Phone Feature",
                                middleText: isPrime(month)
                                    ? 'Month Is Prime'
                                    : 'Month Is Not Prime',
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
                    ),
                  )));
  }
}
