import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToasterror(String label) {
  Fluttertoast.showToast(
      msg: label,
      textColor: Colors.white,
      fontSize: 14,
      gravity: ToastGravity.CENTER,
      backgroundColor: Color.fromARGB(255, 104, 104, 104));
}
