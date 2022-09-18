import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Tab bar"),
            bottom: const TabBar(
              tabs: [
                // Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                // Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")

                // Tab(icon: Icon(Icons.contacts)),
                // Tab(icon: Icon(Icons.camera_alt))

                Tab(text: "Tab1"),
                Tab(text: "Tab2")
              ],
            ),
          ),
          body: const Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: TabBarView(
              children: [
                Tab1(),
                Tab2(),
              ],
            ),
          ),
        ),
      );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Tab1',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.teal))
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Tab2',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.redAccent))
          ],
        ),
      ),
    );
  }
}
