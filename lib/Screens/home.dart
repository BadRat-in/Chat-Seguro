import 'package:flutter/material.dart';
import 'package:secure_chat/Res/colors.dart';
import 'package:secure_chat/Res/userList.dart';
import 'package:share/share.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ChatUsers> userList = [
    ChatUsers(
        name: "Rahul",
        message: "Hello",
        imageUrl: "assets/logo1.png",
        time: "Now"),
    ChatUsers(
        name: "Sumat Singh",
        message: '''What are you Doing look this, 
            "void main() {const str = 'the quick brown fox jumps over the lazy dog';
            const start = 'quick' 
            const end = 'over';"''',
        imageUrl: "assets/login.png",
        time: '2:45 PM'),
    ChatUsers(
        name: 'Shivani Patel',
        message: '''final start
        Index = str.indexOf(start);
  final endIndex = str.indexOf(end, startIndex + start.length);

  print(str.substring(startIndex + start.length, endIndex)); // brown fox jumps
}''',
        imageUrl: 'assets/logo1.png',
        time: 'Yesterday'),
    ChatUsers(
        name: "Bad Rat",
        message: "Good Night, Bye",
        imageUrl: "assets/logo1.png",
        time: "Friday")
  ];

  void main() {
    int count = 0;
    for (ChatUsers msg in userList) {
      userList[count].message = msg.message.replaceAll("\n", " ");
      count++;
    }

    count = 0;

    for (ChatUsers msg in userList) {
      List<String> temp = msg.message.split(" ");
      int count1 = 0;
      String temp_msg = "";
      for (String temp1 in temp) {
        try {
          if (temp1 != temp[count1 + 1]) {
            temp_msg += temp1 + " ";
            count1++;
          }
        } catch (e) {
          userList[count].message = temp[0];
          print(e);
        }
        if (temp.length == 1) {
          temp_msg = temp[0];
        }
      }
      userList[count].message = temp_msg;
      count++;
    }
  }

  int _active = 1;
  TextEditingController searchUser = TextEditingController();
  bool isSearch = false;
  Widget setScreen;
  MaterialColor backcolor = CustomColor().backColor;

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
            ]),
            Row(children: [
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
      style: TextStyle(color: Colors.white, fontSize: 18),
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
    main();
    return ListView.builder(
        itemCount: userList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(userList[index].name);
            },
            child: ListTile(
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
                      : "${userList[index].message.substring(0, 40)}...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    // fontWeight: (index == 0 || index == 3)
                    //     ? FontWeight.bold
                    //     : FontWeight.normal
                  ),
                ),
                trailing: Text(
                  userList[index].time,
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: (index == 0 || index == 3)
                          ? FontWeight.bold
                          : FontWeight.normal),
                )),
          );
        });
  }

  Widget _storyContrainer(context) {
    return Container();
  }

  Widget _addUserContainer(context) {
    return Container();
  }

  Widget _settingsContrainer(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 45,
                    backgroundImage: AssetImage("assets/login.png"),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "About",
                          style: TextStyle(color: Colors.white54, fontSize: 18),
                        )
                      ]),
                ],
              ),
              IconButton(
                  onPressed: () {
                    _editAboutBottomSheet();
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white38,
                    size: 30,
                  ))
            ]),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.white12,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.image,
                      size: 35,
                      color: Colors.white54,
                    ),
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Change Profile Picture",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.vpn_key,
                      size: 35,
                      color: Colors.white54,
                    ),
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Change Password",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.phone,
                      size: 35,
                      color: Colors.white54,
                    ),
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Change Number",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.delete_forever,
                      size: 35,
                      color: Colors.white54,
                    ),
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ]),
              ),
            ),
            Divider(
              color: Colors.white12,
            ),
            GestureDetector(
              onTap: () {
                Share.share("https://www.instagram.com/bad___rat/");
              },
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.share,
                      size: 35,
                      color: Colors.white54,
                    ),
                    maxRadius: 30,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Share with friends",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editAboutBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SafeArea(
            child: Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 25),
              color: backcolor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "      ",
                    style: TextStyle(fontSize: 55),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "About",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      hintStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                      ),
                    ),
                    style: TextStyle(color: Color(0xfffafafa)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(38, 55, 89, 1)),
                      alignment: Alignment.center,
                      child: Text(
                        "Save Change",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
        });
  }
}
