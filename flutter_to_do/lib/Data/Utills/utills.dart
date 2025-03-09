import 'package:flutter/material.dart';

class Utills {
   static void fieldfocusNode(
    BuildContext context,
    FocusNode cuurent,
    FocusNode next,
  ) {
    cuurent.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}