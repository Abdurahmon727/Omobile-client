import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const Color kprimaryColor = Color(0xFFE5204E);
const String appId = '98277';
const String authKey = "ffhNVJzDcjrB9NX";
const String authSecret = "8gMvgEvYmKWyLASv";
const String accountKey = "at_sQcVPB8RmECKnk5hx";

void sentData(String number, String izoh) async {
  var db = FirebaseFirestore.instance.collection('data').doc(number);
  Map<String, String> order = {'kod': number, 'izoh': izoh};
  db.set(order);
}

Future<bool> CheckUserConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
