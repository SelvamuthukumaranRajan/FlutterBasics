import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                "One button",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
            ElevatedButton(
              child: const Text(
                "Two buttons",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showAlertDialogWithTwoButtons(context);
              },
            ),
            ElevatedButton(
              child: const Text(
                "Three buttons",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showAlertDialogWithThreeButtons(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget button = TextButton(
      child: const Text("Button"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Title"),
      content: const Text("Message"),
      actions: [
        button,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogWithTwoButtons(BuildContext context) {

    Widget button1 = TextButton(
      child: const Text("Button1"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget button2 = TextButton(
      child: const Text("Button2"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Title"),
      content: const Text("Message"),
      actions: [
        button1,
        button2
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogWithThreeButtons(BuildContext context) {

    Widget button1 = TextButton(
      child: const Text("Button1"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget button2 = TextButton(
      child: const Text("Button2"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget button3 = TextButton(
      child: const Text("Button3"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Title"),
      content: const Text("Message"),
      actions: [
        button1,
        button2,
        button3
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
