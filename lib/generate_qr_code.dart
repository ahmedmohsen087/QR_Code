import 'package:flutter/material.dart';
import 'package:qr_code/qr_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              maxLines: 1,
              controller: controller,
              keyboardType: TextInputType.phone, // لتوجيه المستخدم لإدخال رقم هاتف
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter phone number',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QRImage(controller.text); // تمرير الرقم مباشرة إلى QRImage
                    },
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a valid phone number')),
                );
              }
            },
            child: const Text('GENERATE QR CODE'),
          ),
        ],
      ),
    );
  }
}


