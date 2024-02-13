import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.55,
      child: Container(
        color: const Color.fromARGB(0, 0, 0, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(35, 51, 49, 49),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    side: const BorderSide(
                      width: 4.0,
                      color: Color.fromARGB(58, 51, 49, 49),
                    )),
                  onPressed: () {
                    //(FirebaseAuth.instance.currentUser != null) ? ():
                  
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  child:const Text(
                    " Çevrimiçi Mod ",
                    style: TextStyle(
                        fontFamily: "ProtestRevolution-Regular", fontSize: 40),
                  )),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(35, 51, 49, 49),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    side: const BorderSide(
                     width: 4.0,
                      color: Color.fromARGB(58, 51, 49, 49),
                    )),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/offline");
                  },
                  child:const Text(
                    "Çevrimdışı Mod",
                    style: TextStyle(
                        fontFamily: "ProtestRevolution-Regular", fontSize: 40),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

