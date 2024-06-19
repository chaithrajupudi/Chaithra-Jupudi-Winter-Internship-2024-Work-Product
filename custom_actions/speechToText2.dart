// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

Future speechToText2() async {
  // Add your function code here!
  SpeechToText speech1 = SpeechToText();
  //await Permission.contacts.request().isGranted
  if (await Permission.microphone.request().isGranted) {
    bool isInitialized = await speech1.initialize();
    FFAppState().transcribedText = 'Listening...';

    if (isInitialized) {
      speech1.listen(
        onResult: (result1) {
          if (!result1.finalResult) {
            FFAppState().update(() {
              FFAppState().transcribedText = '${result1.recognizedWords}';
            });
          }
        },
        partialResults: true,
        cancelOnError: true,
        listenFor: Duration(seconds: 6),
      );
    }
  }
}