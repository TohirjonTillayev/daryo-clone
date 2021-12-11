import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String text;
  CustomListTile(this.text);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
