import 'package:flutter/material.dart';

List<bool> _isSelected = [false, true];

Widget selectLang() {
  return Container(
    width: 180,
    height: 30,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(30.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ToggleButtons(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: _isSelected[0] ? Colors.white : Colors.blue),
              width: 85,
              height: 30,
              child: Text(
                " LOTINCHA",
                style: TextStyle(
                    fontSize: 16,
                    color: _isSelected[0] ? Colors.blue : Colors.white),
              ),
              alignment: Alignment.center,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: _isSelected[1] ? Colors.white : Colors.blue),
              width: 90,
              height: 30,
              child: Text(
                " KIRILCHA",
                style: TextStyle(
                    fontSize: 16,
                    color: _isSelected[1] ? Colors.blue : Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ],
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(index);
          },
        ),
      ],
    ),
  );
}

void setState(int index) {
  if (index == 0) {
    _isSelected[0] = true;
    _isSelected[1] = false;
  } else {
    _isSelected[1] = true;
    _isSelected[0] = false;
  }
  ;
}
