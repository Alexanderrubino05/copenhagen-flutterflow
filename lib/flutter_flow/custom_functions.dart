import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getRandomGUID() {
  final random = math.Random();
  final chars = '0123456789abcdef';
  final segments = [8, 4, 4, 4, 12]; // Length of each segment in the GUID
  final buffer = StringBuffer();

  for (var segment in segments) {
    for (var i = 0; i < segment; i++) {
      final index = random.nextInt(chars.length);
      buffer.write(chars[index]);
    }
    if (segment != segments.last) {
      buffer.write('-');
    }
  }

  return buffer.toString();
}

String? returnCurrentState(String? state) {
  return state;
}

bool gameIs2HoursAgo(DateTime gameDate) {
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(gameDate);
  int hoursDifference = difference.inHours;

  if (hoursDifference > 2) {
    return true;
  } else {
    return false;
  }
}

String returnUserMail() {
  return "VELKOMMEN - fantastisk at du har lyst til at være med i fanklubben. Store oplevelser venter forude og vi ses til næste hjemmekamp. \nFanpakken kan du hente ved næste hjemmekamp hos Fanklubbens bod lige ved siden af indgangen. T-shirt venter klar til dig, gratis entre billet samt en gratis sodavand eller øl. \nHar du spørgsmål så send en email til pr@bccopenhagen.com \n \nFankoordinatorer Nico og Johan";
}

String returnOwnerMailCopy(
  String? name,
  String? email,
  String? size,
) {
  return "En ny fan ville godt være en del af fangruppen. Personen har allerede betalt igennem appen.\n"
      "Navn: $name.\nEmail: $email.\nT-shirt størrelse: $size";
}
