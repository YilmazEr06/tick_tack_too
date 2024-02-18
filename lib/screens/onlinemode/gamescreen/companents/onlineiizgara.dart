import 'package:flutter/material.dart';
import 'package:tick_tack_too/companents/showwin.dart';
import 'package:tick_tack_too/companents/xando/o.dart';
import 'package:tick_tack_too/companents/xando/x.dart';
import 'package:tick_tack_too/firebase/firebase.dart';

class createonlineizgara extends StatefulWidget {
  const createonlineizgara({
    super.key,
    required this.top,
    required this.left,
    required this.nextuser,
    required this.next,
    required this.check,
    required this.seeskor,
  });
  final double top;
  final double left;
  final VoidCallback nextuser;
  final void Function(Map map) check;
  final void Function(Map map) seeskor;

  final bool next;
  @override
  State<createonlineizgara> createState() => _createoState();
}

class _createoState extends State<createonlineizgara> {
  late Gradient gradient;
  int sayac = 0;
  Map status = {
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
  };
  Map skor = {"x": 0, "o": 0};
  String who="x";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    firebasehlp().currentgameid.then((value) {
      firebasehlp().gameinfo(value).then((value) {
        setState(() {
          if (value!["X"]["id"] == firebasehlp().currentuserid) {
            who = "x";
          } else {
            who = "o";
          }
        });
      });
    });
    gradient = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color.fromARGB(255, 3, 91, 52), Color.fromARGB(130, 0, 0, 0)]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gameid= "QgwGJhcYvUhKmaNnKdQ6";
    firebasehlp().currentgameid.then((value) {
      setState(() {
        gameid = value;
      });
    
    });
    

      firebasehlp().gameinfostream("QgwGJhcYvUhKmaNnKdQ6")
      .listen((event) {
        setState(() {
            status["o"]= event.data()!["o"];
            status["x"]= event.data()!["x"];
            print("object");
          });
      });
    

    Color inkwellbackcolor = Color.fromARGB(0, 242, 21, 5);
    return Stack(children: [
      Positioned(
          top: widget.top,
          left: widget.left,
          child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => gradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Image.asset(
                "lib/png/izgara.png",
                scale: 1,
              ))),
      selectfonk(inkwellbackcolor, "oneone", widget.top + 175, widget.left),
      selectfonk(
          inkwellbackcolor, "twoone", widget.top + 305, widget.left - 10),
      selectfonk(
          inkwellbackcolor, "threeone", widget.top + 450, widget.left - 5),
      selectfonk(
          inkwellbackcolor, "threetwo", widget.top + 450, widget.left + 125),
      selectfonk(
          inkwellbackcolor, "threethree", widget.top + 450, widget.left + 250),
      selectfonk(
          inkwellbackcolor, "onethree", widget.top + 175, widget.left + 250),
      selectfonk(
          inkwellbackcolor, "twothree", widget.top + 305, widget.left + 250),
      selectfonk(
          inkwellbackcolor, "onetwo", widget.top + 175, widget.left + 125),
      selectfonk(
          inkwellbackcolor, "twotwo", widget.top + 300, widget.left + 125),
    ]);
  }

  Positioned selectfonk(
      Color inkwellbackcolor, String index, double top, double left) {
    return Positioned(
        top: top,
        left: left,
        child: Container(
          height: 100,
          width: 100,
          color: inkwellbackcolor,
          child: InkWell(
            splashColor: Colors.transparent,
            child: xoro(index),
            onTap: () {
              setState(() {
                if (status["x"][index] || status["o"][index]) {
                } else {
                  setState(() {
                    status[who][index] = true;
                  });
                
                  firebasehlp().currentgameid.then((value) {
                      firebasehlp().updategametable(value, status);
                  },);
                
                 
                  sayac = sayac + 1;
                  widget.nextuser();
                  check(status, context, refresh, skor, widget.seeskor, sayac);
                }
              });
            },
          ),
        ));
  }

  Widget xoro(String a) => ((status["x"][a])
      ? const createxnoanimation()
      : ((status["o"][a]) ? const createonoanimation() : const SizedBox()));

  void refresh() {
    setState(
      () {
        status = {
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
        };
      },
    );
    sayac = 0;
  }
}

void updatetable(Map status) {
  

}

void check(Map status, BuildContext context, VoidCallback refresh, Map skor,
    final void Function(Map map) seeskor, int sayac) {
  if (sayac == 9) {
    showDialog(
      context: context,
      builder: (_) => Createwhowin(
        whowin: "Berabere",
        size: 50,
        top: 100,
        left: 40,
      ),
    );
    refresh();
  }
  for (var i in ["o", "x"]) {
    if ((status[i]["oneone"] & status[i]["onetwo"] & status[i]["onethree"]) ||
        (status[i]["twoone"] & status[i]["twotwo"] & status[i]["twothree"]) ||
        (status[i]["threeone"] &
            status[i]["threetwo"] &
            status[i]["threethree"]) ||
        (status[i]["oneone"] & status[i]["twoone"] & status[i]["threeone"]) ||
        (status[i]["onetwo"] & status[i]["twotwo"] & status[i]["threetwo"]) ||
        (status[i]["onethree"] &
            status[i]["twothree"] &
            status[i]["threethree"]) ||
        (status[i]["oneone"] & status[i]["twotwo"] & status[i]["threethree"]) ||
        (status[i]["onethree"] & status[i]["twotwo"] & status[i]["threeone"])) {
      showDialog(
        context: context,
        builder: (_) => Createwhowin(
          whowin: i,
          size: 150,
          top: 50,
          left: 90,
        ),
      );
      refresh();
      skor[i] = skor[i] + 1;
      seeskor(skor);
    }
  }
}
