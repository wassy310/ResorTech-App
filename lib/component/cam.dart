import 'package:camera/camera.dart';

class CameraControllerWrapper {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  CameraControllerWrapper(CameraDescription camera) {
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  Future<CameraController> get initializedController async {
    await _initializeControllerFuture;
    return _controller;
  }

  void dispose() {
    _controller.dispose();
  }

  Future<XFile> takePicture() {
    return _controller.takePicture();
  }
}
