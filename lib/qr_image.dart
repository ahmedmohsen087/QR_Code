import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage(this.phoneNumber, {super.key});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: phoneNumber.isNotEmpty
            ? QrImageView(
          data: 'tel:$phoneNumber', // استخدام البروتوكول tel مع الرقم
          size: 280,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size(100, 100),
          ),
        )
            : const Text('Please enter a valid phone number'),
      ),
    );
  }
}
