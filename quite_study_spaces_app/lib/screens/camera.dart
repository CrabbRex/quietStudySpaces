import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhotoScreen extends StatefulWidget {
    final CameraDescription camera;

    const TakePhotoScreen({super.key, required this.camera});

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
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
          if(snapshot.connectionState == ConnectionState.done && _controller.value.isInitialized){
            return Stack(
              children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 3/4,
                      child: CameraPreview(_controller)
                    ),
                  ),
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