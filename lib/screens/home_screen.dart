import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/widgets/bottom_bar.dart';
import 'package:password_generator/widgets/chars_selector.dart';
import 'package:password_generator/widgets/edit_custom_chars_dialog.dart';
import 'package:password_generator/widgets/edit_password_dialog.dart';
import 'package:password_generator/widgets/length_selector.dart';
import 'package:password_generator/widgets/menu.dart';
import 'package:password_generator/widgets/settings_sheet.dart';
import 'package:password_generator/widgets/password.dart';
import 'package:password_generator/widgets/qr_code_dialog.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../provider/password_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final password = context.watch<PasswordProvider>().password;
    final length = context.watch<PasswordProvider>().length;
    final options = context.watch<PasswordProvider>().options;
    final customChars = context.watch<PasswordProvider>().customChars;
    return Scaffold(
      ///
      /// AppBar
      ///
      appBar: AppBar(
        title: const Text('Password Generator'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Menu(showInfo: () => showInfo(context)),
        ],
      ),

      ///
      /// Body
      ///
      body: Column(
        children: [
          ///
          /// Password
          ///
          Password(
            password: password,
            onTap: () => showEditPasswordDialog(context, password),
          ),

          ///
          /// CahrsSelector
          ///
          CharsSelector(
            customChars: customChars,
            options: options,
            toggleOptions: (index) => context.read<PasswordProvider>().toggleOptions(index),
            showCustomCharsDialog: () => showEditCustomCharsDialog(context, customChars),
          ),
          const SizedBox(),

          ///
          /// LengthSelector
          LengthSelector(
            length: length,
            incDecLength: (diff) => context.read<PasswordProvider>().incDecLength(diff),
            setPasswordLength: (length) => context.read<PasswordProvider>().setPasswordLength(length),
          ),
        ],
      ),

      ///
      /// footer
      ///
      persistentFooterButtons: [
        BottomBar(
          copyToClipboard: () async => await Clipboard.setData(ClipboardData(text: password)),
          share: () => share(context, password),
          generateQrCode: () => showQrCodeDialog(context, password),
          editPassword: () => showEditPasswordDialog(context, password),
          showSettingsSheet: () => showSettingsSheet(context, length, customChars),
          generatePassword: () => context.read<PasswordProvider>().generatePassword(),
        ),
      ],
    );
  }

  ///
  /// share
  ///
  Future<void> share(BuildContext context, String password) async {
    SharePlus.instance.share(
      ShareParams(
        title: 'Passwort',
        text: password,
      ),
    );
  }

  ///
  /// showQrCodeDialog
  ///
  Future<void> showQrCodeDialog(BuildContext context, String password) async {
    showDialog(
      context: context,
      builder: (context) => QrCodeDialog(data: password),
    );
  }

  ///
  /// showEditCustomCharsDialog
  ///
  Future<void> showEditCustomCharsDialog(BuildContext context, String customChars) async {
    final String result =
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => EditCustomCharsDialog(
            customChars: customChars,
          ),
        ) ??
        '';

    if (result.isNotEmpty) {
      context.read<PasswordProvider>().setCustomChars(result);
    }
  }

  ///
  /// showPasswordEditDialog
  ///
  Future<void> showEditPasswordDialog(BuildContext context, String password) async {
    final String result =
        await showDialog(
          context: context,
          builder: (context) => EditPasswordDialog(password: password),
        ) ??
        '';
    if (result.isNotEmpty) {
      context.read<PasswordProvider>().setPassword(result);
    }
  }

  ///
  /// showSettingsSheet
  ///
  Future<void> showSettingsSheet(BuildContext context, int length, String customChars) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(2.0)),
      ),
      context: context,
      builder: (context) => SettingsSheet(
        showEditCustomCharsDialog: () => showEditCustomCharsDialog(context, customChars),
      ),
    );
  }

  ///
  /// showInfo
  ///
  Future<void> showInfo(BuildContext context) async {
    showAboutDialog(
      context: context,
      applicationName: 'Password Generator',
      applicationVersion: '1.0',
      applicationIcon: Icon(Icons.password_outlined),
    );
  }
}
