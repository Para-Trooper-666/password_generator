import 'package:flutter/material.dart';

class EditPasswordDialog extends StatefulWidget {
  final String password;
  const EditPasswordDialog({required this.password, super.key});

  @override
  State<EditPasswordDialog> createState() => _EditPasswordDialogState();
}

class _EditPasswordDialogState extends State<EditPasswordDialog> {
  late TextEditingController controller;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Passwort bearbeiten'),

    content: TextField(
      controller: controller,
      autofocus: true,
      maxLines: null,
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Abbruch'),
      ),
      OutlinedButton(
        onPressed: () => Navigator.of(context).pop(controller.text),
        child: const Text('Übernehmen'),
      ),
    ],
  );

  ///
  /// initState
  ///
  @override
  void initState() {
    controller = TextEditingController(text: widget.password);
    super.initState();
  }

  ///
  /// dispose
  ///
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
