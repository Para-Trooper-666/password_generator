import 'package:flutter/material.dart';

class EditCustomCharsDialog extends StatefulWidget {
  final String customChars;
  const EditCustomCharsDialog({super.key, required this.customChars});

  @override
  State<EditCustomCharsDialog> createState() => _EditCustomCharsDialogState();
}

class _EditCustomCharsDialogState extends State<EditCustomCharsDialog> {
  late TextEditingController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: AlertDialog(
      title: const Text('Zeichen bearbeiten'),
      content: TextFormField(
        controller: controller,
        autofocus: true,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () => controller.text = '',
            icon: const Icon(Icons.close_outlined),
          ),
        ),
        validator: (value) => (value == null || value.isEmpty) ? 'Feld darf nicht leer sein' : null,
      ),
      actions: [
        ///
        /// TextButton: Cancel
        ///
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Abbruch'),
        ),

        ///
        /// TextButton: Ok
        ///
        OutlinedButton(
          onPressed: () => formKey.currentState?.validate() ?? false ? Navigator.of(context).pop(controller.text) : null,
          child: const Text('Ok'),
        ),
      ],
    ),
  );

  ///
  /// initState
  ///
  @override
  void initState() {
    controller = TextEditingController(text: widget.customChars);
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

// import 'package:flutter/material.dart';

// class EditCustomCharsDialog extends StatefulWidget {
//   final String customChars;
//   const EditCustomCharsDialog({required this.customChars, super.key});

//   @ov
// erride
//   State<EditCustomCharsDialog> createState() => _EditCustomCharsDialogState();
// }

// class _EditCustomCharsDialogState extends State<EditCustomCharsDialog> {
//   late TextEditingController controller;
//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       key: formKey,
//       title: const Text('Zeichen bearbeiten'),
//       content: TextFormField(
//         controller: controller,
//         autofocus: true,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           suffixIcon: IconButton(
//             onPressed: () => controller.text = '',
//             icon: const Icon(Icons.cancel_outlined),
//           ),
//         ),
//         validator: (value) => (value == null || value.isEmpty) ? 'Feld darf nicht leer sein' : null,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('Abbruch'),
//         ),
//         OutlinedButton(
//           onPressed: () => formKey.currentState?.validate() ?? false ? Navigator.of(context).pop(controller.text) : null,
//           child: const Text('OK'),
//         ),
//       ],
//     );
//   }

//   ///
//   /// initState
//   ///
//   @override
//   void initState() {
//     controller = TextEditingController(text: widget.customChars);
//     super.initState();
//   }

//   ///
//   /// dispose
//   ///
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
