import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> screen({
  required String username,
  required String email,
  required String phonenumber,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").add({
      "Name": username,
      "Email": email,
      "phonenumber": phonenumber,
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Studend Data added")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Stream<QuerySnapshot> fetchstudent() {
  return FirebaseFirestore.instance.collection("Datas").snapshots();
}

Future<void> deletestudent(String ID, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").doc(ID).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Deleted Succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> editstudent(
  String ID,
  String username,
  String email,
  String phonenumber,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").doc(ID).update({
      "Name": username,
      "Email": email,
      "phonenumber": phonenumber,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Edited Succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
