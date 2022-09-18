import 'package:BasicApp/api_screen.dart';
import 'package:BasicApp/getx_screen.dart';
import 'package:BasicApp/provider/UserDetails.dart';
import 'package:BasicApp/take_picture_screen.dart';
import 'package:BasicApp/widgets/alert_dialog_widget.dart';
import 'package:BasicApp/widgets/bottom_bar_widget.dart';
import 'package:BasicApp/widgets/button_widget.dart';
import 'package:BasicApp/widgets/drawer_widget.dart';
import 'package:BasicApp/widgets/form_widget.dart';
import 'package:BasicApp/widgets/icon_widget.dart';
import 'package:BasicApp/widgets/image_widget.dart';
import 'package:BasicApp/widgets/more_widgets.dart';
import 'package:BasicApp/widgets/stream_builder.dart';
import 'package:BasicApp/widgets/tab_bar_widget.dart';
import 'package:BasicApp/widgets/table_widget.dart';
import 'package:BasicApp/widgets/text_field_widget.dart';
import 'package:BasicApp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'file_picker.dart';
import 'getxControllers/UserDetailsController.dart';

void main() {
  runApp(const MyApp());
}

String name = "", password = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetails())],
      child: GetMaterialApp(
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
        home: const MyHomePage(title: 'Basic App'),
      ),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Basic App'),
    // );
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
  //Getx controoleer
  final UserDetailsController pwdGetxController =
      Get.put(UserDetailsController());

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void _changeText() {
    setState(() {
      name = nameController.text;
      password = passwordController.text;
    });
    if (password.isNotEmpty) {
      // if (password.isNotEmpty && password.length > 7) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      context.read<UserDetails>().setPassword(password);
      pwdGetxController.updatePassword(password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // content: Text("$name login Successful password $password"),
        content: Text("Welcome $name"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter valid password"),
      ));
    }
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  // hintText: 'Enter Password (Min 8 Characters)',
                  // icon:  Icon(Icons.lock),
                ),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: Colors.blue)))),
                onPressed: _changeText,
                child: Text("Log in".toUpperCase(),
                    style: const TextStyle(fontSize: 18)))
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void signOut() {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("See you soon!"),
      ));
    }

    const List<String> widgets = <String>[
      "Text",
      "TextField",
      "Button",
      "Form",
      "Icon",
      "Alert Dialog",
      "Bottom Bar",
      "Tab Bar",
      "Image",
      "Drawer",
      "Table",
      "API",
      "File Picker",
      "Getx",
      "Take Picture",
      "Stream builder",
      "More",
    ];

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,

          // children: const [
          //   Card(
          //       child: ListTile(
          //         title: Text("List Item 1"),
          //       )),
          //   Card(
          //     child: ListTile(
          //       title: Text("List Item 2"),
          //     ),
          //   ),
          //   Card(
          //       child: ListTile(
          //         title: Text("List Item 3"),
          //       )),
          // ],
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(color: Colors.blue),
                padding: const EdgeInsets.fromLTRB(10, 25, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hello $name',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                    IconButton(
                      color: Colors.white,
                      onPressed: signOut,
                      icon: const Icon(Icons.logout),
                      iconSize: 28,
                    ),
                  ],
                )),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.0,
                    mainAxisSpacing: 8.0,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    children: List.generate(widgets.length, (index) {
                      return Center(
                          child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, "myRoute");
                          String widget = widgets[index].toLowerCase();
                          String capitalizeWidget =
                              "${widget[0].toUpperCase()}${widget.substring(1).toLowerCase()}";
                          String message =
                              "Welcome to $capitalizeWidget widget screen";

                          switch (widget) {
                            case "text":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TextWidget()),
                                );
                              }
                              break;
                            case "textfield":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TextFieldWidget()),
                                );
                              }
                              break;
                            case "button":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ButtonWidget()),
                                );
                              }
                              break;
                            case "form":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FormWidget()),
                                );
                              }
                              break;
                            case "icon":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const IconWidget()),
                                );
                              }
                              break;
                            case "alert dialog":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AlertDialogWidget()),
                                );
                              }
                              break;
                            case "bottom bar":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigationBarWidget()),
                                );
                              }
                              break;
                            case "tab bar":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TabBarWidget()),
                                );
                              }
                              break;
                            case "image":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ImageWidget()),
                                );
                              }
                              break;
                            case "drawer":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DrawerWidget()),
                                );
                              }
                              break;
                            case "table":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TableWidget()),
                                );
                              }
                              break;
                            case "more":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MoreWidgets()),
                                );
                              }
                              break;
                            case "api":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const APIScreen()),
                                );
                                // Get.to(const APIScreen());
                                message = "Welcome to API Screen";
                              }
                              break;
                            case "file picker":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FilePickerScreen()),
                                );
                                message = "Welcome to File Picker Screen";
                              }
                              break;
                            case "getx":
                              {
                                Get.to(const GetxScreen());
                                message = "Welcome to Getx Screen";
                              }
                              break;
                            case "stream builder":
                              {
                                Get.to(const StreamBuilderScreen());
                                message = "Welcome to Stream Builder Screen";
                              }
                              break;
                            case "take picture":
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TakePictureScreen()),
                                );

                                message = "Welcome to Take Picture Screen";
                              }
                              break;
                            default:
                              {
                                message = "Coming soon!";
                              }
                              break;
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(message),
                          ));
                        },
                        child: Card(
                            color: Colors.white,
                            shape: BeveledRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.blue, width: 1.4),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widgets[index],
                                      style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ]),
                            )),
                      ));
                    })))
          ],
        ),
      ),
    );
  }

  //Edited
}
