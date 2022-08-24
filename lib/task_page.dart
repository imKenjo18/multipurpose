import 'package:flutter/material.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context)
          // showDialog(
          //   context: context,
          //   builder: (_) => CupertinoAlertDialog(
          //     title: Text('Discard changes?'),
          //     content: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text('Changes won\'t be saved.'),
          //     ),
          //     actions: <Widget>[
          //       CupertinoDialogAction(
          //         child: Text('No'),
          //         onPressed: () => Navigator.pop(context),
          //       ),
          //       CupertinoDialogAction(
          //         child: Text('Yes'),
          //         onPressed: () => Navigator.of(context).pop(),
          //       )
          //     ],
          //   )
          ,
          tooltip: 'Cancel',
        ),
        centerTitle: true,
        title: const Text(
          'New task',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: isPinned
                ? const Icon(Icons.push_pin_rounded)
                : const Icon(Icons.push_pin_outlined),
            tooltip: isPinned ? 'Unpin' : 'Pin',
            onPressed: () {
              setState(() {
                if (isPinned) {
                  isPinned = false;
                } else {
                  isPinned = true;
                }
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever_outlined,
              color: Colors.red[700],
            ),
            tooltip: 'Delete',
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Delete task?'),
                        content: const Text(
                            'This action will permanently delete this task.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Decline',
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text('Accept'),
                            onPressed: () => Navigator.popUntil(
                                context, (route) => route.isFirst),
                          ),
                        ],
                      )),
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Description',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.of(context).pop()},
        tooltip: 'Save',
        child: const Icon(Icons.save_rounded),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
            height: 50.0,
            child: Row(
              children: [
                IconButton(
                  color: Colors.white70,
                  onPressed: () {},
                  icon: const Icon(Icons.format_bold_rounded),
                ),
                IconButton(
                  color: Colors.white70,
                  onPressed: () {},
                  icon: const Icon(Icons.format_italic_rounded),
                ),
                IconButton(
                  color: Colors.white70,
                  onPressed: () {},
                  icon: const Icon(Icons.format_underline_rounded),
                ),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
