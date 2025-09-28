import 'package:flutter/material.dart';
import 'package:password_generator/provider/password_provider.dart';
import 'package:password_generator/widgets/length_selector.dart';
import 'package:provider/provider.dart';

import 'chars_selector.dart';

class SettingsSheet extends StatelessWidget {
  final VoidCallback showEditCustomCharsDialog;
  const SettingsSheet({required this.showEditCustomCharsDialog, super.key});

  @override
  Widget build(BuildContext context) {
    final length = context.watch<PasswordProvider>().length;
    final options = context.watch<PasswordProvider>().options;
    final customChars = context.watch<PasswordProvider>().customChars;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16.0),

        ///
        /// Character Selector
        ///
        CharsSelector(
          customChars: customChars,
          options: options,
          toggleOptions: (index) => context.read<PasswordProvider>().toggleOptions(index),
          showCustomCharsDialog: () => showEditCustomCharsDialog(),
        ),

        ///
        /// Length
        ///
        LengthSelector(
          length: length,
          incDecLength: (diff) => context.read<PasswordProvider>().incDecLength(diff),
          setPasswordLength: (length) => context.read<PasswordProvider>().setPasswordLength(length),
        ),
      ],
    );
  }
}
