import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TakePictureScreenState();
  }
}

class _TakePictureScreenState extends State<TakePictureScreen> {

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Take Picture"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Hello", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Expanded(
              child: Container(
                  height:300,
                  width:400,
                  child: controller == null?
                  Center(child:Text("Loading Camera...")):
                  !controller!.value.isInitialized?
                  Center(
                    child: CircularProgressIndicator(),
                  ):
                  CameraPreview(controller!)
              ),
            ),

            ElevatedButton.icon( //image capture button
              onPressed: () async{
                try {
                  if(controller != null){ //check if contrller is not null
                    if(controller!.value.isInitialized){ //check if controller is initialized
                      image = await controller!.takePicture(); //capture image
                      setState(() {
                        //update UI
                      });
                    }
                  }
                } catch (e) {
                  print(e); //show error
                }
              },
              icon: Icon(Icons.camera),
              label: Text("Capture"),
            ),

            Container( //show captured image
              padding: EdgeInsets.all(30),
              child: image == null?
              Text("No image captured"):
              Image.file(File(image!.path), height: 300,),
              //display captured image
            )
          ],
        ),
      ),
    );
  }
}
