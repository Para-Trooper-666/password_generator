import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LengthSelector extends StatelessWidget {
  final int length;
  final ValueChanged<int> incDecLength;
  final ValueChanged<int> setPasswordLength;
  const LengthSelector({required this.length, required this.incDecLength, required this.setPasswordLength, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
    child: InputDecorator(
      decoration: InputDecoration(
        labelText: 'Länge: $length',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[800]!, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          ///
          /// decreaseButton
          ///
          IconButton(
            onPressed: () {
              if (length > 1) {
                HapticFeedback.lightImpact();
                incDecLength(-1);
              }
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),

          ///
          /// slieder
          ///
          Expanded(
            child: Slider(
              year2023: false,
              value: length.toDouble(),
              min: 1.0,
              max: 128,
              divisions: 124,
              onChanged: (length) => setPasswordLength(length.toInt()),
            ),
          ),

          ///
          /// increaseButton
          ///
          IconButton(
            onPressed: () {
              if (length < 128) {
                HapticFeedback.lightImpact();
                incDecLength(1);
              }
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ),
  );
}
