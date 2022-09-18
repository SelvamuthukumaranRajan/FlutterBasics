import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Widget"),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Normal Text',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Coloured Italic Text with FontWeight',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            const Text(
              'Large Text with softWrap: State that is not ephemeral, that you want to share across many parts of your app, and that you want to keep between user sessions, is what we call application state (sometimes also called shared state).',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.deepOrangeAccent,
                  ),
              softWrap: true,
            ),
            const Text(
              'Large Text without softWrap: State that is not ephemeral, that you want to share across many parts of your app, and that you want to keep between user sessions, is what we call application state (sometimes also called shared state).',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.deepOrangeAccent,
              ),
              softWrap: false,
            ),
            const Text(
              'Text with overflow (Ellipsis): Some more text.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Text with overflow (Fade): Some more text.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
            const Text(
              'Text with overflow (Clip): Some more text.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
              overflow: TextOverflow.clip,
            ),
            const Text(
              'Text with overflow (Visible): Some more text.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
              overflow: TextOverflow.visible,
            ),
            RichText(
              text: const TextSpan(
                  text: 'Rich Text with',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Different Color',
                        style: TextStyle(color: Colors.green, fontSize: 25))
                  ]),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'Text with ',
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.access_alarm, color: Colors.red),
                    ),
                  ),
                  TextSpan(
                      text: ' Icon',
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
