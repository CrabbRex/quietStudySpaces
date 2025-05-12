import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class takePhotoScreen extends StatefulWidget {
  const takePhotoScreen({super.key, required this.camera});

  final CameraDescription camera;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Take a Photo")),
      body: FutureBuilder<void>(
        future: _initialiseControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () async {
                try {
                  await _initialiseControllerFuture;
                  final _image = await _controller.takePicture();
                  Navigator.pop(context, _image.path);

                } catch (e) {
                  print("Error taking photo");
                }
              },
              child: Icon(Icons.camera_alt),
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}