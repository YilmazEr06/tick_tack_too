import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_tack_too/models/user.dart';

class firebasehlp {
  bool a = false;

  Stream<User?> get getstatus {
    var astream = FirebaseAuth.instance.authStateChanges();
    return astream;
  }

  String get currentuserid {
    String user = (FirebaseAuth.instance.currentUser == null)
        ? ""
        : FirebaseAuth.instance.currentUser!.uid;
    return user;
  }

  Future<List<Object>> createuserWithemailandPasswordanduserobject(
      String emailAddress, String password,Usermodel user) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      UserCredential a =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      db
          .collection("Users")
          .doc(a.user!.uid.toString())
          .set(user.toFirestore())
          .onError((e, _) => print("Error writing document: $e"));


      
      return ["succes", a];



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ['The password provided is too weak.'];
      } else if (e.code == 'email-already-in-use') {
        return ['The account already exists for that email.'];
      }
      return [e.code];
    } catch (e) {
      return ['The account already exists for that email.'];
    }
  }

  Future<String> loginWithemailAndPassword(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return "succes";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'No user found for that email.';
      } else if (e.code == "network-requested-faild") {
        return "Network eror";
      } else {
        return e.code;
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
