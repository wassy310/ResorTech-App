import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:resortech_app/component/cam.dart';

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  const CameraApp({Key? key, required this.camera}) : super(key: key);

  @override
  CameraAppState createState() => CameraAppState();
}

class CameraAppState extends State<CameraApp> {
  late CameraControllerWrapper _cameraWrapper;
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _cameraWrapper = CameraControllerWrapper(widget.camera);
    _initializeCamera();
  }

  _initializeCamera() async {
    _controller = await _cameraWrapper.initializedController;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ResorTech App')),
      body: _controller == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(child: CameraPreview(_controller!)),
                ElevatedButton(
                  onPressed: () {
                    _cameraWrapper.sendFrameToResortech();
                  },
                  child: const Text('Send Frame'),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _cameraWrapper.dispose();
    super.dispose();
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imagePath));
  }
}
