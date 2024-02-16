import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase/firebase.dart';

class MailIicon extends StatefulWidget {
  const MailIicon({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<MailIicon> createState() => _MailIiconState();
}

class _MailIiconState extends State<MailIicon> {
  int x = 0;
  bool readstatus = true;

  @override
  Widget build(BuildContext context) {
    firebasehlp().getuserinfowithid(firebasehlp().currentuserid).then((value) {
      setState(() {
        readstatus = value.data()!["allmailreaded"];
      });
    });
    return Positioned(
      left: widget.width - 80,
      top: widget.height - 60,
      child: StreamBuilder<QuerySnapshot>(
        stream:
            firebasehlp().getcurrentusermailstream(firebasehlp().currentuserid),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              Maildialog(context, snapshot.data);
              firebasehlp().openmails(firebasehlp().currentuserid);
              setState(() {
                readstatus = true;
              });
            },
            child: readstatus
                ? const Icon(
                    Icons.email_outlined,
                    size: 50,
                  )
                : const Icon(
                    Icons.mark_email_unread_outlined,
                    size: 50,
                  ),
          );
        },
      ),
    );
  }
}

Future<void> Maildialog(BuildContext context, QuerySnapshot? data) async {
  // Fetch additional user info for all documents in the QuerySnapshot
  final List<Map<String, dynamic>> userDataList = [];
  if (data != null) {
    for (final DocumentSnapshot document in data.docs) {
      final Map<String, dynamic> mailData =
          document.data()! as Map<String, dynamic>;
      final userInfo = await firebasehlp().getuserinfowithid(document.id);
      if (mailData["request"] == "false") {
      } else {
        userDataList.add({
          'username': userInfo.data()!['username'],
          'email': mailData[
              'name'], // Or whichever field you want to use from mailData
          "id": document.id
        });
      }
    }
  }

  // Show the dialog with the pre-fetched data
  // ignore: use_build_context_synchronously
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        backgroundColor: const Color.fromARGB(183, 255, 253, 253),
        title: const Text(
          'Gelenler',
          style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontFamily: "ProtestRevolution-Regular"),
        ),
        content: SizedBox(
          width: 300, // Adjust width as needed
          height: 500, // Adjust height as needed
          child: list(userDataList: userDataList),
        ),
      );
    },
  );
}

class list extends StatefulWidget {
  const list({
    super.key,
    required this.userDataList,
  });

  final List<Map<String, dynamic>> userDataList;

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: widget.userDataList.map((userData) {
        return Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(202, 96, 106, 67),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: CircleAvatar(radius: 15),
            subtitle: const Text("Oyun isteği",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ProtestRevolution-Regular")),
            title: Text(
              userData['username'],
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProtestRevolution-Regular"),
            ),
            trailing: SizedBox(
              width: 60,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.userDataList.remove(userData);
                        });

                        firebasehlp().cancelrequest(
                          userData["id"],
                          firebasehlp().currentuserid,
                        );
                      },
                      child: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.black,
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
