import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> selected = StreamController<int>();
  final items = <String>[
    'Grogu',
    'Mace Windu',
    'Obi-Wan Kenobi',
    'Han Solo',
    'Luke Skywalker',
    'Darth Vader',
    'Yoda',
    'Ahsoka Tano',
  ];

  @override
  void initState() {
    // TODO: implement initState
    selected.add(
      Fortune.randomInt(0, items.length),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arisan'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FortuneWheel(
              selected: selected.stream,
              items: [
                for (var it in items) FortuneItem(child: Text(it)),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  selected.add(
                    Fortune.randomInt(0, items.length),
                  );
                });
              },
              child: Text("Putar Sekarang"))
        ],
      )),
    );
  }
}
