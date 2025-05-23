import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'result_screen.dart';

class PlantDiseaseDetector extends StatelessWidget {
  const PlantDiseaseDetector({super.key});

  Future<void> _getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(imageBytes: imageBytes),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                '——— Developers ———',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(title: Text('Vishal kumar Ojha - 23BHI10067')),
            ListTile(title: Text('Rishav Mishra - 23BHI10011')),
            ListTile(title: Text('Abhishek Kumar - 23BHI10052')),
            ListTile(title: Text('Mansi Kaushik - 23BHI10002')),
            ListTile(title: Text('Saniya Saw - 23BHI10022')),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Farm-O-help'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: const Color(0xFFFDF5FC),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/qr_preview.jpg',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _getImage(context, ImageSource.camera),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B859E),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Take a Picture', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _getImage(context, ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B859E),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Gallery', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
