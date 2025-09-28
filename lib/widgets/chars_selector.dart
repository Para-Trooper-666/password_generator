import 'package:flutter/material.dart';
import 'package:password_generator/provider/password_provider.dart';

class CharsSelector extends StatelessWidget {
  final String customChars;
  final Options options;
  final ValueChanged<int> toggleOptions;
  final VoidCallback showCustomCharsDialog;
  const CharsSelector({required this.customChars, required this.options, required this.toggleOptions, required this.showCustomCharsDialog, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
    child: InputDecorator(
      decoration: InputDecoration(
        labelText: 'Optionen',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[800]!, width: 1.0),
        ),
      ),
      child: options.isCustom
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(customChars),
                trailing: IconButton(
                  onPressed: () => toggleOptions(5),
                  icon: const Icon(Icons.close_outlined),
                ),
                onTap: () => showCustomCharsDialog(),
              ),
            )
          : Column(
              children: [
                Row(
                  children: [
                    ///
                    /// lowerCase
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('abc'),
                        selected: options.isCustom ? false : options.hasLowerCase,
                        onSelected: (enabled) => options.isCustom ? null : toggleOptions(1),
                      ),
                    ),

                    ///
                    /// upperCase
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('ABC'),
                        selected: options.isCustom ? false : options.hasUpperCase,
                        onSelected: (enabled) => options.isCustom ? null : toggleOptions(2),
                      ),
                    ),

                    ///
                    /// numbers
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('123'),
                        selected: options.isCustom ? false : options.hasNumbers,
                        onSelected: (enabled) => options.isCustom ? null : toggleOptions(0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ///
                    /// umlauts
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('äöü'),
                        selected: options.isCustom ? false : options.hasUmlauts,
                        onSelected: (enabled) => options.isCustom ? null : toggleOptions(3),
                      ),
                    ),

                    ///
                    /// specials
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('#@!'),
                        selected: options.isCustom ? false : options.hasSpecials,
                        onSelected: (enabled) => options.isCustom ? null : toggleOptions(4),
                      ),
                    ),

                    ///
                    /// Custom
                    ///
                    Expanded(
                      child: ChoiceChip(
                        label: const Text('Custom'),
                        selected: options.isCustom,
                        onSelected: (enabled) => toggleOptions(5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    ),
  );
}
