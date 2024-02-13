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
  final formkey = GlobalKey<FormState>();
  TextEditingController controllerpassword1 = TextEditingController();
  TextEditingController controllerusername = TextEditingController();
  TextEditingController controllerpassword2 = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        width: widget.width,
        height: widget.height * 0.7,
        child: Container(
            color: Color.fromARGB(0, 33, 149, 243),
            child: Column(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      textformfield(
                          validator: (value) {
                            if (value!.length < 5 || value.contains(" ")) {
                              return "Kullanıcı adı en az 5 karakterden oluşmalı ve ' ' içermemelidir!";
                            } else {
                              return null;
                            }
                          },
                          labeltext: "Kullanıcı adı",
                          controller: controllerusername),
                      textformfield(
                          validator: (value) {
                            if (value!.contains("@")||value.contains(".")) {
                              return null;
                            } else {
                              return "Geçersiz format";
                            }
                          },
                          labeltext: "E posta",
                          controller: controlleremail),
                      textformfield(
                          validator: (value) {
                            if (value!.length < 6) {
                              return "çok kısa";
                            } else {
                              return null;
                            }
                          },
                          labeltext: "Şifre",
                          controller: controllerpassword1),
                      textformfield(
                          validator: (value) {
                            if (value == controllerpassword1.text) {
                              return null;
                            } else {
                              return "Şifreler eşleşmiyor";
                            }
                          },
                          labeltext: "Yeniden şifre",
                          controller: controllerpassword2),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                86, 255, 254, 253)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(50)),
                                            side: BorderSide(color: Color.fromARGB(255, 93, 93, 93))))),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {}
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

class textformfield extends StatelessWidget {
  const textformfield({
    super.key,
    required this.validator,
    required this.labeltext,
    required this.controller,
  });
  final String? Function(String?)? validator;
  final String labeltext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: this.validator,
        cursorColor: Colors.grey,
        style: const TextStyle(fontSize: 16, fontFamily: "SF Pro Display"),
        decoration: InputDecoration(
          label: Text(
            labeltext,
            style: const TextStyle(fontFamily: "ProtestRevolution-Regular"),
          ),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          focusColor: Colors.grey,
          fillColor: const Color.fromARGB(84, 255, 255, 255),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
        
      ),
    );
  }
}
