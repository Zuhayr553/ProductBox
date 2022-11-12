import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productbox/constants/theme_data.dart';

Container customTextFeild(TextEditingController controller, String hintText) {
  return Container(
    height: Get.height * 0.08,
    width: Get.width * 0.8,
    padding: const EdgeInsets.only(left: 30, right: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: kTextBorder, width: 2),
        borderRadius: BorderRadius.circular(30)),
    child: Center(
      child: TextFormField(
        controller: controller,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    ),
  );
}

Container customTextFeildWebSocket(
    TextEditingController controller, String hintText) {
  return Container(
    height: Get.height * 0.1,
    width: Get.width * 0.9,

    // height: 120,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: MyThemeData().kWhite,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(33, 158, 188, 0.24),
          blurRadius: 10, // soften the shadow
          spreadRadius: 0, //extend the shadow
          offset: Offset(
            2.0, // Move to right 5  horizontally
            6.0, // Move to bottom 5 Vertically
          ),
        )
      ],
    ),
    child: Center(
      child: TextFormField(
        controller: controller,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18),
          enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    ),
  );
}
