import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:resortech_app/component/cam.dart';
import 'package:resortech_app/infrastructure/resortech_repository.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);

    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          ),
          CaptureButton(_captureImage),
        ],
      ),
    );
  }

  void _captureImage() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final XFile image = await _controller.takePicture();
    final response = await ResortechRepository.postImage(image.path);

    debugPrint(response.body);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
