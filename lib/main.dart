import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:learning1/forms.dart';
import 'package:learning1/radar_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text("SnackBar"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Snack Example"),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("SnackBar Confirm"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Snack Example",
                      style: TextStyle(color: Colors.green),
                    ),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(
                      label: "Evet",
                      textColor: Colors.red,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Evet pressed."),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Başlık"),
                        content: Text("Açıklama"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("İptal")),
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Tamam pressed."),
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text("Tamam"))
                        ],
                      );
                      // return Container(
                      //   color: Colors.transparent,
                      //   child: Text("Deneme"),
                      // );
                    });
              },
              child: Text("Basic Alert"),
            ),
            PopupMenuButton(
              icon: Icon(Icons.open_in_new),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Seçenek 1"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Seçenek 2"),
                  value: 2,
                ),
              ],
              onCanceled: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Menu Canceled."),
                  ),
                );
              },
              onSelected: (selectedValue) {
                if (selectedValue == 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("1 pressed."),
                    ),
                  );
                }
                if (selectedValue == 2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("2 pressed."),
                    ),
                  );
                }
              },
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormsLearning()));
                },
                child: Text("Forms")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RadarExample()));
                },
                child: Text("Radar"))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //   elevation: 200,
      //   backgroundColor: Colors.purple,
      //   foregroundColor: Colors.blue,
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
