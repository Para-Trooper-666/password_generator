import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback showInfo;
  const Menu({required this.showInfo, super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
    onSelected: (value) => showInfo(),
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 'info',
        child: ListTile(
          leading: Icon(Icons.info_outlined),
          title: Text('Info'),
        ),
      ),
    ],
  );
}
