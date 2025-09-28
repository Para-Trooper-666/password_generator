import 'dart:math';
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  ///
  /// constructor
  ///
  PasswordProvider() {
    _generateCharList();
    generatePassword();
  }

  ///
  /// fields
  ///
  int _length = 14;
  late String _password;
  final _numbers = '1234567890';
  final _lowerCase = 'abcdefghijklmnopqrstuvwxyz';
  final _upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final _umlauts = 'äÄöÖüÜ';
  final _specials = '!"§\\\$%&/(){}[]<>=?ß|@€~#*\'+-,;.:-_';
  String _custom = '.-';
  late String _chars;
  final _options = Options();

  ///
  /// getter
  ///
  int get length => _length;
  String get password => _password;
  Options get options => _options;
  String get customChars => _custom;
  bool get isCustom => _options.isCustom;

  ///
  /// setPassword
  ///
  void setPassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  ///
  /// incDecLength
  ///
  void incDecLength(int diff) {
    _length += diff;
    generatePassword();
    notifyListeners();
  }

  ///
  /// setPasswordLength
  ///
  void setPasswordLength(int newLength) {
    _length = newLength;
    generatePassword();
    notifyListeners();
  }

  ///
  /// toggleOptions
  ///
  void toggleOptions(int index) {
    options.toggle(index);
    _generateCharList();
    generatePassword();
    notifyListeners();
  }

  ///
  /// generatePassword
  ///
  void generatePassword() {
    _password = List.generate(_length, (index) => _chars[Random.secure().nextInt(_chars.length)]).join('');
    notifyListeners();
  }

  ///
  /// setCustomChars
  ///
  void setCustomChars(String chars) {
    _custom = chars;
    _generateCharList();
    generatePassword();
    notifyListeners();
  }

  ///
  /// generateCharList
  ///
  void _generateCharList() {
    if (options.isCustom) {
      _chars = _custom;
    } else {
      _chars = '';
      options.hasLowerCase ? _chars += _lowerCase : null;
      options.hasUpperCase ? _chars += _upperCase : null;
      options.hasNumbers ? _chars += _numbers : null;
      options.hasUmlauts ? _chars += _umlauts : null;
      options.hasSpecials ? _chars += _specials : null;
    }
  }
}

///
/// options
///
class Options {
  ///
  /// Fields
  ///
  final _isEnabled = [true, true, true, true, true, false];

  ///
  /// getter
  ///
  bool get hasNumbers => _isEnabled[0];
  bool get hasLowerCase => _isEnabled[1];
  bool get hasUpperCase => _isEnabled[2];
  bool get hasUmlauts => _isEnabled[3];
  bool get hasSpecials => _isEnabled[4];
  bool get isCustom => _isEnabled[5];

  ///
  /// toggle
  ///
  void toggle(int index) {
    if (_canToggle(index)) {
      _isEnabled[index] = !_isEnabled[index];
    }
  }

  bool _canToggle(int index) {
    if (index == 5) {
      return true;
    } else {
      int count = 0;
      for (bool enabled in _isEnabled) {
        if (enabled) {
          count++;
        }
      }
      if (count == 1 && _isEnabled[index]) {
        return false;
      } else {
        return true;
      }
    }
  }
}
