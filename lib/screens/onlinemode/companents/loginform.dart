import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  bool isloginform=true;
  final _formKey = GlobalKey<FormState>();
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
                  key:_formKey ,
                  child: Column(
                    children: [
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: TextFormField(
                          validator: (value) {
                            if(!value!.contains("@")||!value.contains(".")){
                                return  "geçerli deği @ ve .içrmeli";
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
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: TextFormField(
                  
                          validator: (value) {
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(20, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            side: BorderSide(
                                                color:
                                                    Color.fromARGB(204, 161, 194, 33))))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()){
                                    print("object");
                                  }
                                },
                                child: Text("Gırış".toUpperCase(), style: const TextStyle(fontFamily: "ProtestRevolution-Regular", fontSize: 30, color: Color.fromARGB(166, 0, 0, 0),fontWeight: FontWeight.bold))),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
