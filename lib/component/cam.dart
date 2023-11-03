import 'package:camera/camera.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> sendFrameToResortech() async {
    if (_controller.value.isStreamingImages) {
      final XFile image = await _controller.takePicture();
      final bytes = await File(image.path).readAsBytes();

      try {
        final response = await http.post(
          Uri.parse('https://product-api.resortech.com/api/v1/deeplearning'),
          body: jsonEncode({
            'resortechId': 'your_resortech_id_here',
            'imageData': base64Encode(bytes),
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          print('Frame sent successfully');
        } else {
          print('Failed to send frame');
        }
      } catch (e) {
        print('Error sending frame: $e');
      }
    }
  }
}
