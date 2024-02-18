import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:tick_tack_too/models/user.dart';

class firebasehlp {
  bool a = false;

  Stream<User?> get getstatus {
    var astream = FirebaseAuth.instance.authStateChanges();
    return astream;
  }

  Stream<QuerySnapshot> getuserstream() {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Users').snapshots();
    return _usersStream;
  }

 Stream<DocumentSnapshot<Map<String, dynamic>>> getgamechange(){
    return FirebaseFirestore.instance.collection('Users').doc(firebasehlp().currentuserid).snapshots()
    ;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getuserinfowithid(
      String id) async {
    final DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection('Users').doc(id).get();
    return user;
  }

  Stream<QuerySnapshot> getcurrentusermailstream(String userid) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(userid)
        .collection("mail")
        .snapshots();
    return _usersStream;
  }

  String get currentuserid {
    String user = (FirebaseAuth.instance.currentUser == null)
        ? " "
        : FirebaseAuth.instance.currentUser!.uid;
    return user;
  }

  Future<List<Object>> createuserWithemailandPasswordanduserobject(
      String emailAddress, String password, Usermodel user) async {
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

  sendrequest(String whoid, String to) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(to)
        .collection("mail")
        .doc(whoid)
        .set({"request": "true"});
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(to)
        .update({"allmailreaded": false});
  }

  openmails(String id) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .update({"allmailreaded": true});
  }
  updategametable(String gameid,Map table){
    var x = table["x"];
    var o = table["o"];
    FirebaseFirestore.instance.collection("Games").
    doc(gameid).update({"x":x,"o":o});

  }
  cancelrequest(String whoid, String to) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(to)
        .collection("mail")
        .doc(whoid)
        .update({"request": "false"});
  }
 Future<String> get currentgameid async{
   var value= await FirebaseFirestore.instance.collection("Users").doc(firebasehlp().currentuserid).get();
     return  value.data()!["current game"];
  }
  Future<Map<String, dynamic>?>  gameinfo (String id) async{
   var value= await FirebaseFirestore.instance.collection("Games")
   .doc(id).get();
     return  value.data();
  }
  Stream<DocumentSnapshot<Map<String, dynamic>>>  gameinfostream (String id) {
   
     return  FirebaseFirestore.instance.collection("Games")
   .doc(id).snapshots(includeMetadataChanges: true);
  }
 
  creategame(String whoid, String to) async {
    await FirebaseFirestore.instance.collection("Games").add({
      "Which" : false,
      "X": {
        "id": whoid,
        "Skor": 0
      },
      "Y": {
        "id": to,
        "Skor": 0
      },
      "x": {
        'oneone': false,
        'onetwo': false,
        'onethree': false,
        'twoone': false,
        'twotwo': false,
        'twothree': false,
        'threeone': false,
        'threetwo': false,
        'threethree': false
      },
      "o": {
        'oneone': false,
        'onetwo': false,
        'onethree': false,
        'twoone': false,
        'twotwo': false,
        'twothree': false,
        'threeone': false,
        'threetwo': false,
        'threethree': false
      }
    }).then((value) async {
        await FirebaseFirestore.instance
        .collection("Users").doc(whoid).update({
          "current game": value.id
        }
        );
         await FirebaseFirestore.instance
        .collection("Users").doc(to).update({
          "current game": value.id
        }
        );
    });

     
  }
}
