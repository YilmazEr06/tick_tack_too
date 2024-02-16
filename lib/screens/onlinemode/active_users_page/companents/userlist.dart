import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase/firebase.dart';

class userlist extends StatefulWidget {
  const userlist({
    super.key,
  });

  @override
  State<userlist> createState() => _userlistState();
}

class _userlistState extends State<userlist> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      width: MediaQuery.of(context).size.width - 10,
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: firebasehlp().getuserstream(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  if (document.id == firebasehlp().currentuserid) {
                    return Padding(padding: EdgeInsets.all(000));
                  } else {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(140, 115, 150,
                                1), // Change the background color
                            borderRadius: BorderRadius.circular(
                                10), // Optionally, add border radius for rounded corners
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(),
                            onTap: () {
                             
                              firebasehlp().sendrequest(firebasehlp().currentuserid,document.id);
                              print(document.id);
                            },
                            hoverColor: Colors.black,
                            title: Text(
                              data['username'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProtestRevolution-Regular"),
                            ),
                            subtitle: Text(
                              data['email'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProtestRevolution-Regular"),
                            ),
                            trailing: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: (data["status"] == "online")
                                    ? const Color.fromARGB(255, 33, 243, 33)
                                    : const Color.fromARGB(0, 33, 243, 33),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: (data["status"] == "online")
                                      ? const Color.fromARGB(70, 120, 244, 54)
                                      : const Color.fromARGB(0, 120, 244, 54),
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ));
                  }
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
