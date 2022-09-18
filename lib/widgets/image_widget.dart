import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Widget"),
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
            const Text('Image from assets folder'),
            Image.asset(
              'assets/ic_man.png',
              width: 100,
              height: 100,
            ),
            const Text('Image from internet'),
            Image.network(
              'https://picsum.photos/250?image=9',
              height: 100,
              width: 100,
            ),
            const Text('FadeInImage from internet with place holder'),
            FadeInImage.assetNetwork(
                placeholder: 'assets/ic_man.png',
                image: 'https://picsum.photos/250?image=9',
                height: 100,
                width: 100),
            const Text('CachedNetworkImage from internet with place holder'),
            CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: "https://picsum.photos/250?image=9",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,),
                ),
              ),
              placeholder: (context, url) => Container(color: Colors.lightBlueAccent),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
