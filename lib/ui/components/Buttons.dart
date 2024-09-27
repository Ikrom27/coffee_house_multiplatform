import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SizeButton({
  required bool isActive,
  required VoidCallback onPressed,
  required String label,
}) {
  return SizedBox(
    height: 42,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isActive ? Colors.orange : Colors.grey,
            width: 1,
          ),
        ),
        backgroundColor: isActive ? Color(0xFFF9F2ED) : Colors.white,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}
