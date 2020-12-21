import 'package:facebook_newsfeed_simple_ui/models/jsonDataForFacebook.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var profileNameTextStyle =
      TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  var updateTextStyle = TextStyle(
      fontSize: 18, color: Colors.grey.shade900, fontWeight: FontWeight.w200);
  @override
  Widget build(BuildContext context) {
    JsonDataForFacebook model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _profileImage(model.profilePic),
                        _profileName(model.profileName),
                        _whatHasDone(model.update),
                      ],
                    ),
                    Row(
                      children: [
                        _date(model.date),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _status(model.status),
                      ],
                    ),
                    Row(
                      children: [
                        _image(model.displayPic),
                      ],
                    ),
                    Row(
                      children: [
                        _likes(model.likes),
                        SizedBox(width: 50),
                        _comments(model.comments),
                        SizedBox(width: 2),
                        _dot(),
                        SizedBox(width: 2),
                        _shares(model.shares),
                      ],
                    ),
                    Row(children: [Divider(color: Colors.red)]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _likesButton(),
                        _commentsButton(),
                        _sharesButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileImage(profilePic) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.red,
        maxRadius: 20,
        backgroundImage: AssetImage(profilePic),
      ),
    );
  }

  Widget _profileName(profileName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        profileName,
        style: profileNameTextStyle,
      ),
    );
  }

  Widget _whatHasDone(update) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        update,
        style: updateTextStyle,
      ),
    );
  }

  Widget _date(date) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text(date),
        ),
      ],
    );
  }

  Widget _status(status) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(50, 10, 10, 10),
        child: RichText(
            text:
                TextSpan(style: TextStyle(color: Colors.black), text: status)),
      ),
    );
  }

  Widget _image(displayPic) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Center(
        child: Row(
          children: [
            Container(
              child: Image.asset(
                displayPic,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _likes(likes) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 6,
            child: Icon(
              Icons.thumb_up,
              size: 10,
              color: Colors.blue,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 6,
            child: Icon(
              Icons.favorite,
              size: 10,
              color: Colors.red,
            ),
          ),
          Text(likes + " likes",
              style: TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _comments(comments) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 10, 5, 10),
      child: Text(comments + " comments",
          style: TextStyle(color: Colors.grey, fontSize: 10)),
    );
  }

  Widget _dot() {
    return Padding(
        padding: const EdgeInsets.all(1),
        child: Icon(
          Icons.circle,
          color: Colors.grey,
          size: 2,
        ));
  }

  Widget _shares(shares) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 10, 5, 10),
      child: Text(shares + " shares",
          style: TextStyle(color: Colors.grey, fontSize: 10)),
    );
  }

  Widget _likesButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.thumb_up), color: Colors.grey, onPressed: () {}),
          Text("Like", style: TextStyle(color: Colors.grey, fontSize: 20))
        ],
      ),
    );
  }

  Widget _commentsButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.comment), color: Colors.grey, onPressed: () {}),
          Text("Comment", style: TextStyle(color: Colors.grey, fontSize: 20))
        ],
      ),
    );
  }

  Widget _sharesButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.share), color: Colors.grey, onPressed: () {}),
          Text("Share", style: TextStyle(color: Colors.grey, fontSize: 20))
        ],
      ),
    );
  }
}
