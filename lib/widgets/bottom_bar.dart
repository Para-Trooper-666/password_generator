import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback copyToClipboard;
  final VoidCallback share;
  final VoidCallback generateQrCode;
  final VoidCallback editPassword;
  final VoidCallback showSettingsSheet;
  final VoidCallback generatePassword;
  const BottomBar({
    required this.copyToClipboard,
    required this.share,
    required this.generateQrCode,
    required this.editPassword,
    required this.showSettingsSheet,
    required this.generatePassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ///
      /// IconButton: Copy to ClipBoard
      ///
      IconButton(
        onPressed: () => copyToClipboard(),
        icon: const Icon(Icons.copy_outlined),
        tooltip: 'Passwort in die Zwischenablage kopieren',
      ),

      ///
      /// IconButton: Share
      ///
      IconButton(
        onPressed: () => share(),
        icon: const Icon(Icons.share_outlined),
        tooltip: 'Passwort teilen',
      ),

      ///
      /// IconButton: Generate QR-Code
      ///
      IconButton(
        onPressed: () => generateQrCode(),
        icon: const Icon(Icons.qr_code),
        tooltip: 'QR-Code generieren',
      ),
      const VerticalDivider(),

      ///
      /// IconButton: Edit
      ///
      IconButton(
        onPressed: () => editPassword(),
        icon: const Icon(Icons.edit_outlined),
        tooltip: 'Bearbeiten',
      ),

      const Spacer(),

      ///
      /// Mode: Normal
      ///
      FloatingActionButton(
        onPressed: () => generatePassword(),
        tooltip: 'Passwort generieren',
        child: const Icon(Icons.refresh_outlined),
      ),
    ],
  );
}
