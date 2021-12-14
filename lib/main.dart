import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers_and_states/mqa_notifier.dart';
import 'notifiers_and_states/mqa_state.dart';
import 'notifiers_and_states/msettings_notifier.dart';
import 'notifiers_and_states/msettings_state.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final mSettingsNotifier =
    StateNotifierProvider<MSettingsNotifier, MSettingsState>((ref) {
  return MSettingsNotifier(ref);
  //TimerXState(duration: Duration(milliseconds: 0), isRunning: false);
});

final mqaNotifier = StateNotifierProvider<MQANotifier, MQAState>((ref) {
  return MQANotifier(ref);
  //TimerXState(duration: Duration(milliseconds: 0), isRunning: false);
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MQAPage(),
    );
  }
}

class MQAPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MQAPageState();
}

class _MQAPageState extends ConsumerState<MQAPage> {
  @override
  Widget build(BuildContext context) {
    final x = ref.watch(mqaNotifier);

    ref.listen(mqaNotifier, (previous, next) {
      print('STATE UPDATE: $next');
    });

    var buttonStyleStandard = ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.yellow.shade800),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.yellow.shade900, width: 5))));
    var buttonStyleCorrect = ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade500),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.green.shade900, width: 5))));
    var buttonStyleIncorrect = ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade500),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red.shade900, width: 5))));

    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Multiplication")),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.format_list_numbered),
              tooltip: 'Show Snackbar',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: AlertDialog(
                          title: Center(child: Text('Pick your times tables')),
                          content: SettingsToggleGroup(
                              buttonStyleCorrect: buttonStyleCorrect,
                              buttonStyleStandard: buttonStyleStandard),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Done')),
                          ],
                        ),
                      );
                    });
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ]),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${x.question}",
                    style: TextStyle(fontSize: 75),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 5),
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: GridView.count(
                  padding: EdgeInsets.all(5),
                  crossAxisCount: 3,
                  children: x.possibleAnswers.asMap().entries.map((e) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: () {
                                x.progress == MQAStateProgress.asking
                                    ? ref
                                        .read(mqaNotifier.notifier)
                                        .setSelectedIndex(e.key)
                                    : null;
                              },
                              child: SizedBox.expand(
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                        x.possibleAnswers[e.key].toString(),
                                        style: TextStyle(fontSize: 50)),
                                  ),
                                ),
                              ),
                              style: (() {
                                if (x.progress == MQAStateProgress.asking) {
                                  return buttonStyleStandard;
                                } else if (e.key == x.correctAnswerIndex) {
                                  return buttonStyleCorrect;
                                } else if (e.key == x.selectedIndex) {
                                  return buttonStyleIncorrect;
                                } else {
                                  return buttonStyleStandard;
                                }
                              }())),
                        ),
                      ),
                    );
                  }).toList(),
                )),
            // MaterialButton(
            //     child: Text(x.isRunning ? "Stop" : "Start"),
            //     onPressed: () {
            //       var n = ref.read(mqaNotifier.notifier);
            //       x.isRunning ? n.stopTimer() : n.startTimer();
            //     }),
          ],
        ),
      ),
    );
  }
}

class SettingsToggleGroup extends ConsumerWidget {
  const SettingsToggleGroup({
    Key? key,
    required this.buttonStyleCorrect,
    required this.buttonStyleStandard,
  }) : super(key: key);

  final ButtonStyle buttonStyleCorrect;
  final ButtonStyle buttonStyleStandard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var multiplierSettings = ref
        .watch(mSettingsNotifier.select((state) => state.multiplierSettings));

    return Column(
      children: [
        Expanded(
          child: Container(
            width: 280,
            child: GridView.count(
              padding: EdgeInsets.all(5),
              crossAxisCount: 3,
              children: multiplierSettings.entries.map((e) {
                print(e);
                return SizedBox(
                  width: 80,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () {
                            ref
                                .read(mSettingsNotifier.notifier)
                                .toggleMultiplierSetting(e.key);
                          },
                          child: SizedBox.expand(
                            child: Center(
                              child: Text(e.key.toString(),
                                  style: TextStyle(fontSize: 25)),
                            ),
                          ),
                          style: (() {
                            if (e.value) {
                              return buttonStyleCorrect;
                            } else {
                              return buttonStyleStandard;
                            }
                          }())),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        title: Text(widget.title),
      ),
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
