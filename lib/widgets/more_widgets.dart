import 'package:flutter/material.dart';

class MoreWidgets extends StatefulWidget {
  const MoreWidgets({Key? key}) : super(key: key);

  @override
  State<MoreWidgets> createState() => _MoreWidgetsState();
}

class _MoreWidgetsState extends State<MoreWidgets> {
  bool checkboxSelected = false;
  String radioSelected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More Widgets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Checkbox without label", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.redAccent,
              value: checkboxSelected,
              onChanged: (value) {
                setState(() {
                  checkboxSelected = value!;
                });
              },
            ),
            const Text("Checkbox with label", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: const Text("Show Radio Buttons"),
              value: checkboxSelected,
              onChanged: (value) {
                setState(() {
                  checkboxSelected = value!;
                });
              },
              controlAffinity:
              ListTileControlAffinity.trailing, //  <-- leading Checkbox
            ),
            if (checkboxSelected)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Text("Radio1"),
                    leading: Radio(
                        value: "Radio1",
                        groupValue: radioSelected,
                        onChanged: (value) {
                          setState(() {
                            radioSelected = value.toString();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(radioSelected),
                          ));
                        }),
                  ),
                  ListTile(
                    title: const Text("Radio2"),
                    leading: Radio(
                        value: "Radio2",
                        groupValue: radioSelected,
                        onChanged: (value) {
                          setState(() {
                            radioSelected = value.toString();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(radioSelected),
                          ));
                        }),
                  ),
                  ListTile(
                    title: const Text("Radio3"),
                    leading: Radio(
                        value: "Radio3",
                        groupValue: radioSelected,
                        onChanged: (value) {
                          setState(() {
                            radioSelected = value.toString();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(radioSelected),
                          ));
                        }),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
