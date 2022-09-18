import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> items = <String>[
      "Item1",
      "Item2",
      "Item3",
      "Item4",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Widget"),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text(
                'Text Button',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              child: const Text(
                "Elevated Button",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mobile_friendly),
              iconSize: 50,
              color: Colors.blue,
              onPressed: () {},
            ),
            InkWell(
              splashColor: Colors.blue,
              child: const Icon(Icons.ac_unit, size: 50),
              onTap: () {},
            ),
            OutlinedButton(
              child: const Text('Outlined Button'),
              onPressed: () {},
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Button bar1'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text('Button bar2'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text('Button bar3'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => {},
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
