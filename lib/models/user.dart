import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
   String username;
   String email;
   String? password;
   String? uid;
   String? status;
  Usermodel( { this.uid,required this.username, required this.email,  this.password, this.status});
 factory Usermodel.defaultuser(

   )
   {
  
     return Usermodel(
      username: 'username',
      email: 'email',
      password: 'password',
      uid: 'uid',
      status: "status"

    );
    
   }
  factory Usermodel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,

  ) {
    final data = snapshot.data();
    return Usermodel(
      username: data?['username'],
      email: data?['email'],
      password: data?['password'],
      uid: data?['uid'],
      status: data?['status']
    );
  }
  

  Map<String, dynamic> toFirestore() {
    return {
      if (username != null) "username": username,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (uid != null) "uid": uid,
    };
  }

}