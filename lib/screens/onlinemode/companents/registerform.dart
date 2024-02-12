import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class registerform extends StatefulWidget {
  const registerform({
    super.key,
    required this.width,
    required this.height,
    required this.changeform,
  });
  final void Function(bool) changeform;
  final double width;
  final double height;

  @override
  State<registerform> createState() => _registerformState();
}

class _registerformState extends State<registerform> {
  final formkey= GlobalKey<FormState>();
  TextEditingController controllerpassword1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Positioned(
        top: 200,
        width: widget.width,
        height: widget.height * 0.6,
        child: Container(
            color: const Color.fromARGB(71, 33, 149, 243),
            child: Column(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: TextFormField(
                          validator:(value) {
                          if(value!.length<5){
                              return  "çok kısa";
                          }
                          else {
                            return null;
                          }
                        } ,
                          cursorColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "SF Pro Display"),
                          decoration: const InputDecoration(
                            label: Text(
                              "Kullanıcı adı",
                              style: TextStyle(
                                  fontFamily: "ProtestRevolution-Regular"),
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            fillColor: Color.fromARGB(84, 255, 255, 255),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: TextFormField(
                          controller: controllerpassword1,
                           validator:(value) {
                          if(value!.length<6){
                              return  "çok kısa";
                          }
                          else {
                            return null;
                          }
                        },
                          cursorColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "SF Pro Display"),
                          decoration: const InputDecoration(
                            label: Text(
                              "Şifre",
                              style: TextStyle(
                                  fontFamily: "ProtestRevolution-Regular"),
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            fillColor: Color.fromARGB(84, 255, 255, 255),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: TextFormField(
                           validator:(value) {
                          if( value==controllerpassword1.text  ){
                                 return null;
                          }
                          else {
                        
                             return  "Şifreler eşleşmiyor";
                          }
                        },
                          cursorColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "SF Pro Display"),
                          decoration: const InputDecoration(
                            label: Text(
                              "Yeniden şifre",
                              style: TextStyle(
                                  fontFamily: "ProtestRevolution-Regular"),
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            fillColor: Color.fromARGB(84, 255, 255, 255),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(86, 255, 254, 253)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            side: BorderSide(
                                                color:
                                                    Color.fromARGB(255, 93, 93, 93))))),
                                onPressed: () {
                                  if(formkey.currentState!.validate()){
        
                                  }
                                },
                                child: Text("Kaydol".toUpperCase(), style: const TextStyle(fontFamily: "ProtestRevolution-Regular", fontSize: 30, color: Color.fromARGB(166, 0, 0, 0)))),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(173, 0, 0, 0),
                                            fontFamily:
                                                "ProtestRevolution-Regular"),
                                        text: 'Hesabın varmı '),
                                    TextSpan(
                                        text: 'hemen giriş yap!!',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily:
                                                "ProtestRevolution-Regular"),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            widget.changeform(true);
        
                                            print('Hesabın ');
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
