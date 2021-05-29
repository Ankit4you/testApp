import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testApp/listItem.dart';

import 'User.dart';

class DetailScreen extends StatelessWidget {
  User user;
  DetailScreen({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ActiveItem(
                factor: 100,
                photoURL: user.imageUrl,
                name:
                    '${user.firstName.split('')[0]}${user.lastName.split('')[0]}',
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '${user.firstName} ${user.lastName} ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '${user.email}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              baseRow('Address', user.address),
              SizedBox(
                height: 5,
              ),
              baseRow('Contact No.', user.contactNumber),
              SizedBox(
                height: 5,
              ),
              baseRow('Salary', "${user.salary}\$"),
              SizedBox(
                height: 5,
              ),
              baseRow('Age', user.age.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget baseRow(String label, String value) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Text(
            '$label : ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
          child: Text(
            '$value',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
