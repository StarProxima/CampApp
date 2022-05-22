import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/app_images.dart';
import 'package:camp_app/styles/button_styles.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.onDetect}) : super(key: key);
  final Function() onDetect;
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> with SingleTickerProviderStateMixin {
  MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    formats: [BarcodeFormat.qrCode],
    facing: CameraFacing.back,
  );

  bool isStarted = true;

  bool wasFind = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                controller: controller,
                fit: BoxFit.contain,
                onDetect: (barcode, args) {
                  setState(() {
                    if (!wasFind) {
                      wasFind = true;
                      widget.onDetect();
                    }
                    //barcode.rawValue;
                    //Navigator.of(context).pop();
                  });
                },
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                  ),
                  child: ElevatedButton(
                      style: onlyIcons,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Image(
                        height: 24,
                        width: 24,
                        color: Colors.white,
                        image: AppImages.back,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: Colors.black.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: onlyIcons,
                        child: ValueListenableBuilder(
                          valueListenable: controller.torchState,
                          builder: (context, state, child) {
                            if (state == null) {
                              return const Icon(
                                Icons.flash_off,
                                color: Colors.grey,
                              );
                            }
                            switch (state as TorchState) {
                              case TorchState.off:
                                return const Icon(
                                  Icons.flash_off,
                                  color: Colors.grey,
                                );
                              case TorchState.on:
                                return const Icon(
                                  Icons.flash_on,
                                  color: Colors.white,
                                );
                            }
                          },
                        ),
                        onPressed: () => controller.toggleTorch(),
                      ),
                      ElevatedButton(
                        style: onlyIcons,
                        child: ValueListenableBuilder(
                          valueListenable: controller.cameraFacingState,
                          builder: (context, state, child) {
                            if (state == null) {
                              return const Icon(Icons.camera_front);
                            }
                            switch (state as CameraFacing) {
                              case CameraFacing.front:
                                return const Icon(Icons.camera_front);
                              case CameraFacing.back:
                                return const Icon(Icons.camera_rear);
                            }
                          },
                        ),
                        onPressed: () => controller.switchCamera(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
