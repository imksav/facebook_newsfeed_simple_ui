import 'package:facebook_newsfeed_simple_ui/models/jsonDataForFacebook.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height, width;
  bool _isLoading = false;
  Widget _enabledLoadingWidget = LinearProgressIndicator();
  Widget _disabledLoadingWidget = SizedBox();
  List<Widget> _listItems = List();
  List data;
  var profileNameTextStyle =
      TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  var updateTextStyle = TextStyle(
      fontSize: 18, color: Colors.grey.shade900, fontWeight: FontWeight.w200);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook NewsFeed Simple UI"),
        actions: [
          _refreshIcon(),
          SizedBox(width: 5),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            (_isLoading == true)
                ? _enabledLoadingWidget
                : _disabledLoadingWidget,
            _myList(),
          ],
        ),
      ),
    );
  }

  Widget _refreshIcon() {
    return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          _dataFromJson();
        });
  }

  _dataFromJson() async {
    _enabledLoading();

    String response = await DefaultAssetBundle.of(context)
        .loadString('json/jsonDataForFacebook.json');

    _responseDecoder(response);
    _disabledLoading();
  }

  _enabledLoading() {
    setState(() {
      _isLoading == true;
    });
  }

  _disabledLoading() {
    setState(() {
      _isLoading == false;
    });
  }

  _responseDecoder(String body) {
    List list = jsonDecode(body);

    List<Widget> tempList = List();
    for (int i = 0; i < list.length; i++) {
      Map eachElement = list[i];

      //
      JsonDataForFacebook model = JsonDataForFacebook(
        update: eachElement['update'],
        id: eachElement['id'],
        profileName: eachElement['profileName'],
        profilePic: eachElement['profilePic'],
        date: eachElement['date'],
        status: eachElement['status'],
        displayPic: eachElement['displayPic'],
        likes: eachElement['likes'],
        comments: eachElement['comments'],
        shares: eachElement['shares'],
      );
      Widget titleCard = _card(model);
      tempList.add(titleCard);
    }
    _listItems = tempList;

    setState(() {});
  }

  Widget _myList() {
    return SizedBox(
      height: height * .85,
      width: width,
      child: ListView(
        children: _listItems,
      ),
    );
  }

  Widget _card(JsonDataForFacebook model) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: model);
      },
      child: Card(
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: CircleAvatar(
                          maxRadius: 20,
                          backgroundImage: AssetImage(model.profilePic),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      model.profileName,
                      style: profileNameTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      model.update,
                      style: updateTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 65),
                    child: Text(model.date),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: updateTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: model.status,
                                    style: (model.status == "#")
                                        ? TextStyle(color: Colors.blue[300])
                                        : TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Image(
                          height: 150,
                          width: 150,
                          image: AssetImage(
                            model.displayPic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cards(JsonDataForFacebook model) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: model);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundImage: AssetImage(model.profilePic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.profileName,
                      style: profileNameTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.update,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: updateTextStyle,
                    ),
                  ),
                ],
              ),
              Text(model.status),
            ],
          )),
        ),
      ),
    );
  }
}
