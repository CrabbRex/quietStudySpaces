import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class takePhotoScreen extends StatefulWidget {
    final CameraDescription camera;

    const takePhotoScreen({super.key, required this.camera});

  @override
  State<takePhotoScreen> createState() => _takePhotoScreenState();
}

class _takePhotoScreenState extends State<takePhotoScreen> {
  late CameraController _controller;
  late Future<void> _initialiseControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera, 
      ResolutionPreset.medium
    );

    _initialiseControllerFuture = _controller.initialize();
  }

  @override dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initialiseControllerFuture;
      final image = await _controller.takePicture();
      Navigator.pop(context, image.path);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Take a Photo")),
      body: FutureBuilder<void>(
        future: _initialiseControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,                                
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt, color: Colors.black,),
                      onPressed: _takePicture,
                      ),
                  ),)
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      );
  }
}