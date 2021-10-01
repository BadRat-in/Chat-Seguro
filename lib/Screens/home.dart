import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _active = 1;
  Widget setScreen;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Seguro"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "signin");
              },
              icon: Icon(
                Icons.logout,
                size: 30,
              ))
        ],
      ),
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
                      setScreen = _storyContrainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 2
                        ? Icons.video_collection
                        : Icons.video_collection_outlined,
                    size: 35,
                    color: _active == 2 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("Story"),
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
                      setScreen = _settingsContrainer(context);
                    });
                  },
                  icon: Icon(
                    _active == 3 ? Icons.settings : Icons.settings_outlined,
                    size: 35,
                    color: _active == 3 ? Colors.blue[900] : Colors.blueGrey,
                  )),
              AnimatedDefaultTextStyle(
                  child: Text("Settings"),
                  style: TextStyle(
                      color: _active == 3 ? Colors.blue[900] : Colors.blueGrey,
                      fontWeight:
                          _active == 3 ? FontWeight.bold : FontWeight.w500,
                      fontSize: _active == 3 ? 20 : 0),
                  duration: const Duration(milliseconds: 200))
            ]),
          ],
        ),
      ),
      body: setScreen != null ? setScreen : _homeContrainer(context),
    );
  }

  Widget _homeContrainer(context) {
    return ListView(

    );
  }

  Widget _storyContrainer(context) {
    return Container();
  }

  Widget _settingsContrainer(context) {
    return Container();
  }
}
