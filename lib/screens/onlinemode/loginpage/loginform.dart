import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tick_tack_too/firebase/firebase.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.width,
    required this.height,
    required this.changeform,
  });

  final double width;
  final double height;
  final void Function(bool) changeform;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isloginform = true;
  final _formKey = GlobalKey<FormState>();
  final controlleremail = TextEditingController();
  final controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        width: widget.width,
        height: widget.height * 0.6,
        child: Container(
            color: Color.fromARGB(0, 33, 149, 243),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textformfield(
                          validator: (value) {
                            if (!value!.contains("@") || !value.contains(".")) {
                              return "geçerli deği '@' ve '.' içrmeli";
                            } else {
                              return null;
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
                          controller: controllerpassword),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                20, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(50)),
                                            side: BorderSide(color: Color.fromARGB(204, 161, 194, 33))))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    firebasehlp().loginWithemailAndPassword(controlleremail.text,controllerpassword.text).then((value) {
                                      if (value== "succes"){
                                        Navigator.pushNamedAndRemoveUntil(context, "/activeusers", (route) => false);
                                      }
                                    },);
                                    print("object");
                                  }
                                },
                                child: Text("Gırış".toUpperCase(), style: const TextStyle(fontFamily: "ProtestRevolution-Regular", fontSize: 30, color: Color.fromARGB(166, 0, 0, 0), fontWeight: FontWeight.bold))),
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
                                        text: 'Hesabın yokmu '),
                                    TextSpan(
                                        text: 'hemen oluştur!!',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily:
                                                "ProtestRevolution-Regular"),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            widget.changeform(false);

                                            print('kaydol"');
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
