// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getProductIndex(String? productName) async {
  // Add your function code here!
  List<ItemStruct>? items = FFAppState().items;
  int index = 0;
  for (var item in items) {
    if ((item.name).toLowerCase() == productName?.toLowerCase()) {
      index = item.index;
    }
  }
  return index;
}