// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code

Future<DocumentReference> checkJoinCode(String joinCode) async {
  final groups = await FirebaseFirestore.instance
      .collection("groups")
      .where("join_code", isEqualTo: joinCode)
      .get();
  if (groups.docs.isNotEmpty) {
    return groups.docs.first.reference;
  }
  return null;
}
