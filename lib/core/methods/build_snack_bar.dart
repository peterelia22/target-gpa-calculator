import 'package:flutter/material.dart';

SnackBar buildSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );
}
