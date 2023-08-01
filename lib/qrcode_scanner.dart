import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey();
  late QRViewController controller;
  Barcode? result;
  String resultqr = '';
  bool isFlashLight = false;
  bool isFlipCamera = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermissionAndOpenScanner();
  }

  Future<void> _checkCameraPermissionAndOpenScanner() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      _openQRScanner();
    } else {
      print('Camera permission not granted!');
    }
  }

  void _openQRScanner() {
    if (mounted) {
      setState(() {
        result = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF2cb2e6),
        title: Text(
          'QR Reader',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      //customizing scan area
                      borderWidth: 10,
                      borderColor: Color.fromARGB(255, 0, 91, 165),
                      borderLength: 15,
                      borderRadius: 10,
                      cutOutSize: MediaQuery.of(context).size.width * 0.7,
                      overlayColor: Colors.blue.withOpacity(0.5)),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.flipCamera();
                            setState(() {
                              isFlipCamera = !isFlipCamera;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isFlipCamera
                                    ? Colors.blue[900]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.flip_camera_ios,
                                    color: isFlipCamera
                                        ? Colors.white
                                        : Colors.blue[900],
                                  ),
                                  Text(
                                    'Switch Camera',
                                    style: TextStyle(
                                        color: isFlipCamera
                                            ? Colors.white
                                            : Colors.blue[900]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.toggleFlash();
                            setState(() {
                              isFlashLight = !isFlashLight;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isFlashLight
                                    ? Colors.blue[900]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.flash_on,
                                    color: isFlashLight
                                        ? Colors.white
                                        : Colors.blue[900],
                                  ),
                                  Text(
                                    'Open Flash Light',
                                    style: TextStyle(
                                        color: isFlashLight
                                            ? Colors.white
                                            : Colors.blue[900]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0.0,
                    right: 0.0,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Make sure the QR code is within the frame',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     margin: EdgeInsets.all(8.0),
          //     width: double.infinity,
          //     color: Colors.white,
          //     child: Center(
          //       child: result != null
          //           ? Column(
          //               children: [
          //                 Text('Code: ${result!.code}'),
          //                 SizedBox(
          //                   height: 8.0,
          //                 ),
          //                 Text('Format: ${result!.format}'),
          //               ],
          //             )
          //           : Text('Scan Code'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController p1) {
    //called when View gets created.
    this.controller = p1;
    controller.scannedDataStream.listen((scanevent) {
      setState(() {
        //UI gets created with new QR code.
        result = scanevent;
        resultqr = scanevent.code.toString();
        print('resultqr: $resultqr');
        _openLink();
      });
    });
  }

  void _openLink() async {
    if (await canLaunch(resultqr)) {
      await launch(resultqr);
    } else {
      print('Could not launch $result');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
