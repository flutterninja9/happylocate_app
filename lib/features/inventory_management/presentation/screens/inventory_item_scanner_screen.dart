import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_listing_screen.dart';

class InventoryItemScannerScreen extends StatefulWidget {
  const InventoryItemScannerScreen({Key? key}) : super(key: key);

  @override
  State<InventoryItemScannerScreen> createState() =>
      _InventoryItemScannerScreenState();
}

class _InventoryItemScannerScreenState extends State<InventoryItemScannerScreen>
    with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  late CameraController controller;
  bool cameraReady = false;
  String cameraStatus = "";

  @override
  void initState() {
    super.initState();
    fetchAvailableCameras().then((des) => initCamera(des));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      // handle not initialized
      return;
    } else if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera(cameras);
    }
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance?.addObserver(this);
    super.didChangeDependencies();
  }

  Future<List<CameraDescription>> fetchAvailableCameras() async {
    cameras = await availableCameras();
    return cameras;
  }

  Future<void> initCamera(List<CameraDescription> description) async {
    try {
      controller = CameraController(cameras.first, ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          cameraReady = true;
        });
      });
    } catch (e) {
      if (e is CameraException) {
        setState(() {
          cameraStatus = "Please allow camera access for proceeding";
        });
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HlScaffold(
      appBarTitle: 'Camera View',
      page: cameraReady
          ? Column(
              children: [
                Container(
                  height: context.height * 0.8,
                  width: context.width,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: CameraPreview(controller),
                ),
                if (cameraStatus.isNotEmpty)
                  Center(
                    child: Text(cameraStatus),
                  ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.value.isRecordingVideo)
                        ElevatedButton(
                          onPressed: () async {
                            await controller.pauseVideoRecording();
                            setState(() {});
                          },
                          child: const Text('Pause'),
                        )
                      else
                        ElevatedButton(
                          onPressed: () async {
                            await controller.startVideoRecording();
                            setState(() {});
                          },
                          child: const Text('Start Recording'),
                        ),
                      if (controller.value.isRecordingPaused)
                        ElevatedButton(
                          onPressed: () async {
                            await controller.resumeVideoRecording();
                            setState(() {});
                          },
                          child: const Text('Continue Recording'),
                        ),
                      const SizedBox(width: 12),
                      if (controller.value.isRecordingVideo)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InventoryListingScreen(),
                              ),
                            );
                          },
                          child: const Text('Stop Recording'),
                        )
                      else
                        Container(
                          foregroundDecoration: const BoxDecoration(
                            color: Colors.grey,
                            backgroundBlendMode: BlendMode.saturation,
                          ),
                          child: const ElevatedButton(
                            onPressed: null,
                            child: Text('Stop Recording'),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
