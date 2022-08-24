import 'package:flutter/material.dart';
import './settings_page.dart';
import './about_page.dart';
import './games_page.dart';

class MyTimerPage extends StatefulWidget {
  const MyTimerPage({Key? key}) : super(key: key);

  @override
  _MyTimerPageState createState() => _MyTimerPageState();
}

class _MyTimerPageState extends State<MyTimerPage> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.av_timer_rounded),
    Icon(Icons.timer_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Timer',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(child: getDrawerContent(context)),
        body: Center(
          child: body[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[900],
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white70,
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Timer',
                icon: Icon(Icons.av_timer_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Stopwatch',
                icon: Icon(Icons.timer_rounded),
              ),
            ]));
  }
}

Widget getDrawerContent(BuildContext context) {
  return ListView(
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Kenjo\'s Lab',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.note_alt_outlined),
        title: const Text('Notes and Tasks'),
        onTap: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pop(context);
        },
      ),
      ListTile(
          leading: const Icon(Icons.watch_later_outlined),
          title: const Text('Timer'),
          selected: true,
          selectedTileColor: Colors.black12,
          onTap: () => Navigator.pop(context)),
      ListTile(
          leading: const Icon(Icons.play_circle_outline_rounded),
          title: const Text('Games'),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyGamesPage()))),
      const Divider(
        thickness: 2.5,
      ),
      ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MySettingsPage()))),
      ListTile(
          leading: const Icon(Icons.info_outline_rounded),
          title: const Text('About'),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyAboutPage()))),
    ],
  );
}
