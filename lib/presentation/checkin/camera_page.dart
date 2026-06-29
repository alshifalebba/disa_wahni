import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final CameraLensDirection lensDirection;

  const CameraPage({super.key, required this.lensDirection});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;

  bool isInitialized = false;
  bool isCapturing = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();

    CameraDescription selectedCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == widget.lensDirection,
      orElse: () => cameras.first,
    );

    controller = CameraController(
      selectedCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller!.initialize();

    if (!mounted) return;

    setState(() {
      isInitialized = true;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> captureImage() async {
    if (controller == null) return;
    if (!controller!.value.isInitialized) return;
    if (isCapturing) return;
    isCapturing = true;
    
    final image = await controller!.takePicture();

    if (!mounted) return;

    Navigator.pop(context, image);
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: CameraPreview(controller!)),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: captureImage,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
