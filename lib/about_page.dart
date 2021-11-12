import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({Key? key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  void _launchWebsite() async {
    String url = 'https://kenjoslab.netlify.app';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Blah blah blah blah.\n',
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              child: const Text('Visit My Website'),
              onPressed: _launchWebsite,
            )
          ],
        ),
      ),
    );
  }
}
