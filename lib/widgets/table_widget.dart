import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table Widget"),
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
            Table(
              defaultColumnWidth: const FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1),
              children: [
                TableRow(children: [
                  Container(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: const [
                        Text('Head1', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                  Container(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: const [
                        Text('Head2', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                  Container(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: const [
                        Text('Head3', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row1')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row2')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row3')]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row1')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row2')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row3')]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row3')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row2')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [Text('Row3')]),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
