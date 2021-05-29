import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testApp/listItem.dart';

import 'Services.dart';
import 'User.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    assignUsers();
  }

  assignUsers() async {
    List<User> data = await Services.getAllEmployees();
    setState(() {
      users.addAll(data);
    });
  }

  DateTime backbuttonpressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "Double Click to exit app",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Employee List'),
            centerTitle: true,
            leading: Container(),
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
              AlphabetScrollView(
                  list: users.map((e) => AlphaModel(e.firstName)).toList(),
                  
                  alignment: LetterAlignment.right,
                  itemExtent: 60,
                  isAlphabetsFiltered: true,
                  itemBuilder: (_, k, __) {
                    User user = users[k];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/detail', arguments: user);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItem(
                          user: user,
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
