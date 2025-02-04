import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  saveUserDetails(String userName, String gmail, String password, String uid,
      DateTime updatedAt) async {
    await FirebaseFirestore.instance.collection("User").doc(uid).set({
      "userName": userName,
      "gmail": gmail,
      "password": password,
      "uid": uid,
      "updatedAt": updatedAt,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }
}
