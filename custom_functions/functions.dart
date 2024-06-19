import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? totalPrice(List<ItemStruct>? appStateVariable) {
  int? length = appStateVariable?.length;
  double total = 0;
  for (int? i = 0; i! < length!; i++) {
    if (appStateVariable![i].isInCart == true)
      total += (appStateVariable[i].quantity * appStateVariable[i].price);
  }
  return total.toString();
}

String? deliveryDate() {
  DateTime now = DateTime.now();
  DateTime sevenDaysFromNow = now.add(Duration(days: 7));
  String formattedDate = DateFormat('MMM dd, yyyy').format(sevenDaysFromNow);
  return (formattedDate); // Print the formatted date
}

String? displayTranscribedText(String? text) {
  return text;
}
