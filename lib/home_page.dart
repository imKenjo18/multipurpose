import 'package:flutter/material.dart';
import './task_page.dart';
import './settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './about_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _openTaskPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyTaskPage()));
    _incrementCounter();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  // void _printPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   dynamic prefer = prefs.getKeys();
  //   print(prefer);
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          // widget.title,
          "Notes and Tasks",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () => Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const MySettingsPage())),
        //       tooltip: 'Settings',
        //       icon: const Icon(Icons.settings_rounded)),
        // ],
      ),
      drawer: Drawer(child: getDrawerContent(context)),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Times you tried to create a new task:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openTaskPage,
        tooltip: 'New Task',
        child: const Icon(Icons.add_rounded),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // This trailing comma makes auto-formatting nicer for build methods.
    );
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
          // DrawerHeader(
          //   child: const Text(
          //     'Kenjo\'s Lab',
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          // child: Container(
          //   color: Colors.grey,
          //   child: const Center(
          //     child: Text(
          //       'Drawer Header',
          //       style: TextStyle(
          //         color: Colors.black
          //       ),
          //     ),
          //   )
          // )
        ),
      ),
      ListTile(
        leading: const Icon(Icons.note_alt_outlined),
        title: const Text('Notes and Tasks'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.timer_rounded),
        title: const Text('Timer'),
        onTap: () {},
      ),
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
