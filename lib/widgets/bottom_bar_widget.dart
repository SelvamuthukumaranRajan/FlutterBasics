import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;
  List<Widget> widgets = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Tab1',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.redAccent))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Tab2',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.purpleAccent))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Tab3',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.teal))
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: Center(
        child: widgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Tab1'),
          BottomNavigationBarItem(icon: Icon(Icons.punch_clock), label: 'Tab2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining), label: 'Tab3'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
