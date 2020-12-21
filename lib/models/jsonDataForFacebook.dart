import 'package:flutter/cupertino.dart';

class JsonDataForFacebook {
  String update;
  int id;
  String profileName;
  String profilePic;
  String date;
  String status;
  String displayPic;
  String likes;
  String comments;
  String shares;
  JsonDataForFacebook({
    @required this.update,
    @required this.id,
    @required this.profileName,
    @required this.profilePic,
    this.date,
    this.status,
    this.displayPic,
    this.likes,
    this.comments,
    this.shares,
  });
}
