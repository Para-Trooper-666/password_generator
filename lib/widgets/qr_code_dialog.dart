import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeDialog extends StatelessWidget {
  final String data;
  const QrCodeDialog({required this.data, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250.0,
        child: QrImageView(
          data: data,
          dataModuleStyle: QrDataModuleStyle(color: Colors.white),
          eyeStyle: QrEyeStyle(color: Colors.white),
          backgroundColor: Colors.black,
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    ),
  );
}
