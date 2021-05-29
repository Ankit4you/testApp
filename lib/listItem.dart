import 'package:flutter/material.dart';

import 'User.dart';

class ListItem extends StatelessWidget {
  User user;
  ListItem({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                child: ActiveItem(
                  name:
                      '${user.firstName.split('')[0]}${user.lastName.split('')[0]}',
                  factor: 50,
                  photoURL: user.imageUrl,
                ),
              )),
          SizedBox(width: 10),
          Flexible(
              flex: 5,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.firstName} ${user.lastName}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${user.email}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

//couldn't access dummy apis photoURLs in physcial device so i put alternate
class ActiveItem extends StatelessWidget {
  String name;
  double factor;
  String photoURL;
  ActiveItem({this.photoURL, this.factor, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: factor,
        height: factor,
        child: CircleAvatar(
          radius: factor,
          backgroundColor: Colors.grey,
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // image: DecorationImage(image: NetworkImage(photoURL))
        ));
  }
}
