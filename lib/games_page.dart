import 'package:flutter/material.dart';
import './about_page.dart';
import './settings_page.dart';
import './timer_page.dart';
import 'dart:math';

class MyGamesPage extends StatefulWidget {
  const MyGamesPage({Key? key}) : super(key: key);

  @override
  _MyGamesPageState createState() => _MyGamesPageState();
}

class _MyGamesPageState extends State<MyGamesPage> {
  int _currentIndex = 0;
  // final _pageController = PageController();

  // Guessing Game Variables
  int guessStackIndex = 0;
  final category = [
    ['naruto', 'bleach', 'boruto', 'one piece', 'tokyo ghoul'],
    ['birch tree', 'palm tree', 'oak tree', 'mango tree', 'narra tree']
  ];
  dynamic selectedCategory;
  String secretWord = '';
  String guess = '';
  int guessesLeft = 1;
  int score = 0;
  String hint = '';

  // Tic-Tac-Toe Variables
  int tttStackIndex = 0;
  bool gameActive = true;
  String currentPlayer = 'X';
  dynamic gameState = ['', '', '', '', '', '', '', '', ''];
  String winningMessage() {
    return 'Player $currentPlayer has won.';
  }

  String drawMessage() {
    return 'Game ended in a draw!';
  }

  String currentPlayerTurn() {
    return 'It\'s $currentPlayer\'s turn.\n';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Games',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(child: getDrawerContent(context)),
      // body: PageView(
      //   controller: _pageController,
      //   children: <Widget>[
      //     SizedBox(
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Row(children: <Widget>[
      //               ElevatedButton(
      //                 style: ButtonStyle(
      //                     backgroundColor:
      //                         MaterialStateProperty.all<Color>(Colors.green)),
      //                 child: const Text('Anime'),
      //                 onPressed: () {
      //                   setState(() {
      //                     selectedCategory = category[0];
      //                     _setSecretWord();
      //                   });
      //                 },
      //               ),
      //               ElevatedButton(
      //                 style: ButtonStyle(
      //                     backgroundColor:
      //                         MaterialStateProperty.all<Color>(Colors.green)),
      //                 child: const Text('Trees'),
      //                 onPressed: () {
      //                   setState(() {
      //                     selectedCategory = category[1];
      //                     _setSecretWord();
      //                   });
      //                 },
      //               ),
      //               ElevatedButton(
      //                 style: ButtonStyle(
      //                     backgroundColor:
      //                         MaterialStateProperty.all<Color>(Colors.green)),
      //                 child: const Text('Random'),
      //                 onPressed: () {
      //                   setState(() {
      //                     selectedCategory = category[Random().nextInt(2)];
      //                     _setSecretWord();
      //                   });
      //                 },
      //               ),
      //             ]),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          IndexedStack(
            index: guessStackIndex,
            children: <Widget>[
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Guessing Game\n',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        child: const Text('Play'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          setState(() {
                            guessStackIndex = 1;
                            if (score >= 7) {
                              guessesLeft = 2;
                            } else {
                              guessesLeft = 1;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Select a category\n',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        child: const Text('Anime'),
                        onPressed: () {
                          setState(() {
                            selectedCategory = category[0];
                            _setSecretWord();
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        child: const Text('Trees'),
                        onPressed: () {
                          setState(() {
                            selectedCategory = category[1];
                            _setSecretWord();
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        child: const Text('Random'),
                        onPressed: () {
                          setState(() {
                            selectedCategory = category[Random().nextInt(2)];
                            _setSecretWord();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              selectedCategory == category[0]
                  ? SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '$hint'
                              '\n',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Naruto'),
                              onPressed: () {
                                setState(() {
                                  guess = 'naruto';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Bleach'),
                              onPressed: () {
                                setState(() {
                                  guess = 'bleach';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Boruto'),
                              onPressed: () {
                                setState(() {
                                  guess = 'boruto';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('One Piece'),
                              onPressed: () {
                                setState(() {
                                  guess = 'one piece';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Tokyo Ghoul'),
                              onPressed: () {
                                setState(() {
                                  guess = 'tokyo ghoul';
                                  confirmGuess();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '$hint'
                              '\n',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Birch Tree'),
                              onPressed: () {
                                setState(() {
                                  guess = 'birch tree';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Palm Tree'),
                              onPressed: () {
                                setState(() {
                                  guess = 'palm tree';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Oak Tree'),
                              onPressed: () {
                                setState(() {
                                  guess = 'oak tree';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Mango Tree'),
                              onPressed: () {
                                setState(() {
                                  guess = 'mango tree';
                                  confirmGuess();
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Narra Tree'),
                              onPressed: () {
                                setState(() {
                                  guess = 'narra tree';
                                  confirmGuess();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              guessesLeft != 0
                  ? SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'You guessed it!\n',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Play Again'),
                              onPressed: () {
                                setState(() {
                                  guessStackIndex = 1;
                                  guessesLeft = 1;
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Main Menu'),
                              onPressed: () {
                                setState(() {
                                  guessStackIndex = 0;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              score < 7
                                  ? 'You failed to guess it.\n'
                                      'Try again.\n'
                                  : 'Still failed with 2 guesses?\n',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Play Again'),
                              onPressed: () {
                                setState(() {
                                  guessStackIndex = 1;
                                  if (score >= 7) {
                                    guessesLeft = 2;
                                  } else {
                                    guessesLeft = 1;
                                  }
                                });
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              child: const Text('Main Menu'),
                              onPressed: () {
                                setState(() {
                                  guessStackIndex = 0;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              if (score == 7)
                SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Are you having fun?\n'
                          'Since you keep playing this\n'
                          'boring game, I\'ll let you\n'
                          'guess twice from now on.\n',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text('Play Again'),
                          onPressed: () {
                            setState(() {
                              guessStackIndex = 1;
                              guessesLeft = 2;
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text('Main Menu'),
                          onPressed: () {
                            setState(() {
                              guessStackIndex = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              else if (score > 7)
                SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'You got that right.\n'
                          'Well, you better should\n'
                          'since you can guess twice.\n',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text('Play Again'),
                          onPressed: () {
                            setState(() {
                              guessStackIndex = 1;
                              guessesLeft = 2;
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          child: const Text('Main Menu'),
                          onPressed: () {
                            setState(() {
                              guessStackIndex = 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
          IndexedStack(
            index: tttStackIndex,
            children: <Widget>[
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Tic-Tac-Toe\n',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        child: const Text('Play'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          setState(() {
                            tttStackIndex = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        currentPlayerTurn(),
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        child: const Text('Pause'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          setState(() {
                            gameActive = false;
                          });
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Restart'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          setState(() {
                            gameState = ['', '', '', '', '', '', '', '', ''];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
              label: 'Guess', icon: Icon(Icons.help_center_rounded)),
          BottomNavigationBarItem(
            label: 'Tic-Tac-Toe',
            icon: Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }

  // Guessing Game Functions
  void _setSecretWord() {
    if (selectedCategory == category[0]) {
      secretWord = category[0][Random().nextInt(category[0].length)];
    } else if (selectedCategory == category[1]) {
      secretWord = category[1][Random().nextInt(category[1].length)];
    }

    switch (secretWord) {
      case 'naruto':
        hint = 'His father is known as the "Yellow Flash."';
        break;
      case 'bleach':
        hint = 'They have a form called "bankai."';
        break;
      case 'boruto':
        hint = 'The son of the 7th Hokage.';
        break;
      case 'one piece':
        hint = 'The protagonist is the captain of the Straw Hat Pirates.';
        break;
      case 'tokyo ghoul':
        hint = 'The protagonist is a one-eyed ghoul.';
        break;
      case 'birch tree':
        hint = 'It\'s like a cow tree.';
        break;
      case 'palm tree':
        hint = 'A tree that produces palm oil.';
        break;
      case 'oak tree':
        hint = 'The most common tree in Minecraft.';
        break;
      case 'mango tree':
        hint = 'A tree that first appeared in India over 5,000 years ago.';
        break;
      case 'narra tree':
        hint = 'The Philippine national tree.';
        break;
    }

    guessStackIndex = 2;
  }

  void confirmGuess() {
    if (guess != secretWord) {
      guessesLeft--;
    } else {
      score++;
      if (score >= 7) {
        guessStackIndex = 4;
      } else if (score < 7) {
        guessStackIndex = 3;
      }
    }

    if (guessesLeft == 0) {
      // secretWord = secretWord.toUpperCase();
      guessStackIndex = 3;
    }
  }

  // Tic-Tac-Toe Functions
  // void handleCellPlayed(clickedCell, clickedCellIndex) {
  //   gameState[clickedCellIndex] = currentPlayer;
  //   clickedCell = currentPlayer;
  // }
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
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyTimerPage()))),
      ListTile(
        leading: const Icon(Icons.play_circle_outline_rounded),
        title: const Text('Games'),
        selected: true,
        selectedTileColor: Colors.black12,
        onTap: () => Navigator.pop(context),
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
