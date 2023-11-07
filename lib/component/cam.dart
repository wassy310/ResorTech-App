import 'package:flutter/material.dart';

class CaptureButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CaptureButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Capture Image'),
      ),
    );
  }
}
