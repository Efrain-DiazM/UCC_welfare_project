import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firebase_event.dart' as firebaseEventService;
import 'package:flutter_ucc_welfare_project/utils/services/firestore.dart' as firestoreService;
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EventRegistration extends StatefulWidget {
  const EventRegistration({Key? key}) : super(key: key);

  @override
  State<EventRegistration> createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedData;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (mounted) {
        controller!.pauseCamera();
      }
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _showQRScanner() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text(AppText.scanQR),
          content: SizedBox(
            width: 300,
            height: 300,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller?.dispose();
              },
              child: Text(AppText.homeClose),
            ),
          ],
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code;
      });
      controller.stopCamera();
      Navigator.of(context).pop();
      _saveScannedData(scanData.code);
    });
  }

  void _saveScannedData(String? data) async {
  if (data != null) {
    try {
      print("Datos escaneados: $data");
      
      if (data.startsWith("Event:")) {
        final lines = data.split('\n');
        
        final Map<String, dynamic> eventData = {};
        
        for (var line in lines) {
          if (line.startsWith("Event: ")) {
            eventData['name'] = line.substring(7).trim();
          } else if (line.startsWith("Description: ")) {
            eventData['description'] = line.substring(13).trim();
          } else if (line.startsWith("Hours: ")) {
            eventData['hours'] = line.substring(7).trim();
          } else if (line.startsWith("Date: ")) {
            eventData['date'] = line.substring(6).trim();
          } 
          // else if (line.startsWith("End Time: ")) {
          //   eventData['endTime'] = line.substring(10).trim();
          // }
        }
        
        final eventDataToSave = {
          'name': eventData['name'],
          'description': eventData['description'],
          'hours': eventData['hours'],
          'date': eventData['date'],
          // 'endTime': eventData['endTime']
        };
        
        await firestoreService.FirestoreServics().addDocument('assistance', eventDataToSave);
        
      } else {
      }
    } catch (e) {
    }
  }
}


  Future<List<Map<String, dynamic>>> getAllCollection({required String nameCollection}) async {
    return await firestoreService.FirestoreServics().getAllCollection(nameCollection);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Escanear QR',
                  style: TextStyle(fontSize: AppSizes.lg, fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: _showQRScanner,
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0,),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await getAllCollection(nameCollection: 'assistance');
                setState(() {});
              },
              child: FutureBuilder(
                future: getAllCollection(nameCollection: 'assistance'),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;

                    return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final event = data?[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              event?['name'],
                              style: const TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${event?['category']}\n'
                              'Date: ${event?['date']} - '
                              'Hours: ${event?['hours']}'
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      // ),
    );
  }
}
