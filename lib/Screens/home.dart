import 'package:flutter/material.dart';
import 'package:secure_chat/Res/userList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ChatUsers> userList = [
    ChatUsers(
        name: "Rahul",
        message: "Hello",
        imageUrl: "assets/user.jpg",
        time: "Now"),
    ChatUsers(
        name: "Sumat Singh",
        message:
            "What are you Doing dfhjs fegkhsdfsdkhj  sdfljsdfsfljsdglodhj dnhfkgdighd ijoif h",
        imageUrl: "assets/login.png",
        time: '17 Mar'),
    ChatUsers(
        name: 'Shivani Patel',
        message:
            'Lets go fdkjgdfg dfsdkhfs sdfoijdesr   erth9iu kfhjsdfthew wejhrdosi',
        imageUrl: 'assets/user.jpg',
        time: 'Today')
  ];
  int _active = 1;
  TextEditingController searchUser = TextEditingController();
  bool isSearch = false;
  Widget setScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchUser.addListener(() {
      print(searchUser.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: isSearch ? createSearchfield() : Text("Chat Seguro"),
          leading: isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: Icon(Icons.arrow_back))
              : null,
          actions: [
            isSearch
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    iconSize: 28,
                    onPressed: () {
                      setState(() {
                        if (searchUser.text.length > 0) {
                          searchUser.clear();
                        } else {
                          isSearch = false;
                        }
                      });
                    },
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isSearch = true;
                      });
                    },
                    icon: Icon(Icons.search),
                    iconSize: 28,
                    color: Colors.white,
                  ),
            SizedBox(
              width: 8,
            )
          ]),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _active = 1;
                      setScreen = _homeContrainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 1 ? Icons.home : Icons.home_outlined,
                    size: 35,
                    color: _active == 1 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("Home"),
                  style: TextStyle(
                      color: _active == 1 ? Colors.blue[900] : Colors.blueGrey,
                      fontWeight:
                          _active == 1 ? FontWeight.bold : FontWeight.w500,
                      fontSize: _active == 1 ? 20 : 0),
                  duration: const Duration(milliseconds: 200))
            ]),Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _active = 2;
                      setScreen = _addUserContainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 2 ? Icons.add : Icons.add_outlined,
                    size: 35,
                    color: _active == 2 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("New Chat"),
                  style: TextStyle(
                      color: _active == 2 ? Colors.blue[900] : Colors.blueGrey,
                      fontWeight:
                          _active == 2 ? FontWeight.bold : FontWeight.w500,
                      fontSize: _active == 2 ? 20 : 0),
                  duration: const Duration(milliseconds: 200))
            ]),
            Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _active = 3;
                      setScreen = _storyContrainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 3
                        ? Icons.video_collection
                        : Icons.video_collection_outlined,
                    size: 35,
                    color: _active == 3 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("Story"),
                  style: TextStyle(
                      color: _active == 3 ? Colors.blue[900] : Colors.blueGrey,
                      fontWeight:
                          _active == 3 ? FontWeight.bold : FontWeight.w500,
                      fontSize: _active == 3 ? 20 : 0),
                  duration: const Duration(milliseconds: 200))
            ]),
            Row(children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _active = 4;
                      setScreen = _settingsContrainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 4 ? Icons.settings : Icons.settings_outlined,
                    size: 35,
                    color: _active == 4 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("Settings"),
                  style: TextStyle(
                      color: _active == 4 ? Colors.blue[900] : Colors.blueGrey,
                      fontWeight:
                          _active == 4 ? FontWeight.bold : FontWeight.w500,
                      fontSize: _active == 4 ? 20 : 0),
                  duration: const Duration(milliseconds: 200))
            ]),
          ],
        ),
      ),
      body: setScreen != null ? setScreen : _homeContrainer(context),
    );
  }


  Widget createSearchfield() {
    return TextField(
      cursorColor: Colors.white70,
      style: TextStyle(
          color: Colors.white,fontSize: 18
      ),
      decoration: InputDecoration(
          focusColor: Colors.white38,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white70,
          ),
          hintText: "Search User",
          hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
      autofocus: true,
      controller: searchUser,
    );
  }


  Widget _homeContrainer(context) {
    return ListView.builder(
        itemCount: userList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(userList[index].imageUrl),
                maxRadius: 30,
              ),
              title: Text(
                userList[index].name,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: Text(
                (userList[index].message.length <= 40)
                    ? userList[index].message
                    : 'message',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: (index == 0 || index == 3)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              trailing: Text(
                userList[index].time,
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: (index == 0 || index == 3)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ));
        });
  }

  Widget _storyContrainer(context) {
    return Container();
  }

  Widget _addUserContainer(context){
    return Container();
  }

  Widget _settingsContrainer(context) {
    return Container();
  }
}
