import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final String password;
  final VoidCallback onTap;
  const Password({required this.password, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: GestureDetector(
          onTap: () => onTap(),
          child: Text(
            password,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    ),
  );
}
