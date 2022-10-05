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
